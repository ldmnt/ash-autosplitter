// to customize split points, change the global parameters in the "startup" block

state("AShortHike"){
    int feather: "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x234;
    // int silverFeathers: "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x270;
    byte12 position: "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x8, 0x1C, 0x1C, 0x4, 0x18, 0x8, 0x20, 0x10, 0x30;
    int screen: "UnityPlayer.dll", 0x105C480, 0x3C;
    float igt: "UnityPlayer.dll", 0x10B6780, 0x4, 0x4, 0x14, 0x0, 0x48, 0x18, 0x28;
}

startup{
    // split on gold feather grab if the new amount is in this list
    vars.FEATHER_SPLITS = new HashSet<int>() { 4, 5, 13 };

    // split on shell grab if the new amount is in this list 
    vars.SHELL_SPLITS = new HashSet<int>() { 14 };

    // save and quit splits
    vars.SPLIT_ON_OUTLOOK = true;
    vars.SPLIT_ON_FROST = true;     // the one right above the college kid
    vars.SPLIT_ON_VISITOR_CENTER = true;
    vars.SPLIT_ON_MAY = false;   // the one near the start at the end of agf

    // do not modify
    vars.SUMMIT = new float[3] { 399.8647f, 606.32938f, 795.0003f };
    vars.SUMMIT_GROUND_ALTITUDE = 602.02f;
    vars.SUMMIT_MAX_ALTITUDE = 620f;    // approximation
    vars.SUMMIT_SQUARED_RADIUS = 160f;   // approximation, the summit area is actually a parallelepiped5
    vars.VISITOR_CENTER = new float[3] { 157.98f, 32.20f, 122.22f };
    vars.OUTLOOK = new float[3] { 266.04f, 253.27f, 347.58f };
    vars.FROST = new float[3] { 253.58f, 319.51f, 587.67f };
    vars.MAY = new float[3] { 611.85f, 27.89f, 299.51f };

    vars.sigScanTarget = new SigScanTarget(37, "C745AC00000000C745B000000000C745B400000000BA????????8BC0E8????????894720BA????????8D6D00E8????????89458C85FF");
}

init{
    // sigscan for GlobalData instance
    ThreadStart startScan = new ThreadStart(() => {
        print("scan started");
        var ptr = IntPtr.Zero;
        while (ptr == IntPtr.Zero)
        {
            foreach (var page in game.MemoryPages(true))
            {
                var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
                if ((ptr = scanner.Scan(vars.sigScanTarget)) != IntPtr.Zero)
                {
                    break;
                }
            }
            if (ptr == IntPtr.Zero)
            {
                print("scan not successful yet");
                Thread.Sleep(1000);
            }
        }
        vars.globalData = ptr;
        vars.shellsPtr = new DeepPointer(vars.globalData, 0x24, 0x4, 0x0, 0xC, 0xC, 0xC, 0xC, 0x2C);
        print("scan finished : " + vars.globalData.ToString("x"));
    });
    vars.globalData = IntPtr.Zero;
    vars.thread = new Thread(startScan);
    vars.thread.Start();

    vars.lastValidIGT = 0;
    vars.position = new float[3] { 0.0f, 0.0f, 0.0f };
    vars.shells = 0;

    vars.squaredDistance = (Func<float[], float[], float>) ((v1, v2) => 
    {
        float res = 0;
        for (int i = 0; i < v1.Length; i++)
        {
            float diff = v2[i] - v1[i];
            res += diff * diff;
        }
        return res; 
    });

    vars.horizontalSquaredDistance = (Func<float[], float[], float>) ((v1, v2) =>
    {
        float res = 0;
        for (int i = 0; i < 3; i += 2)
        {
            float diff = v2[i] - v1[i];
            res += diff * diff;
        }
        return res;
    });

    vars.initialize = (Action) (() =>
    {
        vars.reachedSummit = false;
        vars.justSavedAndQuit = false;
        vars.saveAndQuitSplit = false;
    });
    vars.initialize();
}

update{
    // Wait for scan to finish
    if (vars.globalData == IntPtr.Zero)
    {
        return false;
    }

    vars.oldShells = vars.shells;
    vars.shells = vars.shellsPtr.Deref<int>(game);

    if (current.position != null)
    {
        Buffer.BlockCopy(current.position, 0, vars.position, 0, 12);
    }
    else
    {
        for (int i = 0; i < 3; i++)
        {
            vars.position[i] = 0;
        }
    }

    vars.justSavedAndQuit = (old.screen == 192 && current.screen == 0);
    if (vars.justSavedAndQuit)
    {
        bool isAtVisitorCenter = vars.squaredDistance(vars.position, vars.VISITOR_CENTER) < 5.0f;
        bool isAtOutlook = vars.squaredDistance(vars.position, vars.OUTLOOK) < 5.0f;
        bool isAtFrost = vars.squaredDistance(vars.position, vars.FROST) < 5.0f;
        bool isAtMay = vars.squaredDistance(vars.position, vars.MAY) < 5.0f;
        if (
            isAtVisitorCenter && vars.SPLIT_ON_VISITOR_CENTER ||
            isAtOutlook && vars.SPLIT_ON_OUTLOOK ||
            isAtFrost && vars.SPLIT_ON_FROST ||
            isAtMay && vars.SPLIT_ON_MAY)
        {
            vars.saveAndQuitSplit = true;
            vars.justSavedAndQuit = false;
        }
        else if (vars.position[0] > 0.0f)
        {
            vars.justSavedAndQuit = false;
        }
    }
}

start{
    bool must_start = 
        (old.igt == 0 && current.igt > 0 && current.screen == 612) ||
        (old.igt == 0 && current.igt > 0 && current.screen == 516) ||
        (old.igt == 0 && current.igt > 0 && current.screen == 216);
    if (must_start) vars.initialize();
    return must_start;

}

split{
    if (vars.saveAndQuitSplit)
    {
        vars.saveAndQuitSplit = false;
        return true;
    }

    bool isAtSummit =
        vars.horizontalSquaredDistance(vars.position, vars.SUMMIT) < vars.SUMMIT_SQUARED_RADIUS &&
        vars.SUMMIT_GROUND_ALTITUDE - 0.05f < vars.position[1] &&
        vars.position[1] < vars.SUMMIT_MAX_ALTITUDE;
    if (isAtSummit && !vars.reachedSummit)
    {
        vars.reachedSummit = true;
        return true;
    }

    if (current.feather > old.feather && vars.FEATHER_SPLITS.Contains(current.feather))
    {
        return true;
    }

    if (vars.oldShells < vars.shells && vars.SHELL_SPLITS.Contains(vars.shells))
    {
        return true;
    }

    return (current.screen == 96) || (current.screen == 108 && old.screen == 384); 
}

reset{
    return current.screen == 24;
}

isLoading{
    return true;
}

gameTime{
    if(current.igt != 0){
        vars.lastValidIGT = current.igt;
        return TimeSpan.FromSeconds(current.igt);
    }else{
        return TimeSpan.FromSeconds(vars.lastValidIGT);
    }
}