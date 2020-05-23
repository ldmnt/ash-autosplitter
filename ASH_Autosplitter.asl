state("AShortHike") {
    int feather          : "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x234;
    int silverFeathers   : "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x270;
    byte12 position      : "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x8, 0x1C, 0x1C, 0x4, 0x18, 0x8, 0x20, 0x10, 0x30;
    // int screen        : "UnityPlayer.dll", 0x105C480, 0x3C;
    int startend         : "UnityPlayer.dll", 0x105C800, 0x12C;
    float igt            : "UnityPlayer.dll", 0x10B6780, 0x4, 0x4, 0x14, 0x0, 0x48, 0x18, 0x28;
}

startup {
    // coordinates to check against the player location after save and quits
    vars.SAVE_AND_QUIT_SPLITS = new Dictionary<string, float[]>() {
        { "Outlook", new float[3] { 266.04f, 253.27f, 347.58f } },
        { "Center", new float[3] { 157.98f, 32.20f, 122.22f } },
        { "Frost", new float[3] { 253.58f, 319.51f, 587.67f } },
        { "May", new float[3] { 611.85f, 27.89f, 299.51f } },
        { "Frog", new float[3] { 340.32f, 22.49f, 73.08f } }
    };

    // player collision capsule
    vars.PLAYER_HEIGHT = 1.923962f;
    vars.PLAYER_RADIUS_SQUARED = 0.16f;

    // summit area description (rectangular box defined by its center and half extents)
    vars.SUMMIT = new float[3] { 399.8647f, 606.32938f, 795.0003f };
    vars.SUMMIT_SIZE = new float[3] { 7.326245f, 7.15712f, 4.547681f };

    settings.Add("feathers", true, "Splitting upon collecting a specified number of feathers, regardless of order:");
        settings.Add("feather1", true, "Feather N° 1", "feathers");
        settings.Add("feather2", true, "Feather N° 2", "feathers");
        settings.Add("feather3", true, "Feather N° 3", "feathers");
        settings.Add("feather4", true, "Feather N° 4", "feathers");
        settings.Add("feather5", true, "Feather N° 5", "feathers");
        settings.Add("feather6", true, "Feather N° 6", "feathers");
        settings.Add("feather7", true, "Feather N° 7", "feathers");
        settings.Add("feather8", true, "Feather N° 8", "feathers");
        settings.Add("feather9", true, "Feather N° 9", "feathers");
        settings.Add("feather10", true, "Feather N° 10", "feathers");
        settings.Add("feather11", true, "Feather N° 11", "feathers");
        settings.Add("feather12", true, "Feather N° 12", "feathers");
        settings.Add("feather13", true, "Feather N° 13", "feathers");
        settings.Add("feather14", true, "Feather N° 14", "feathers");
        settings.Add("feather15", true, "Feather N° 15", "feathers");
        settings.Add("feather16", true, "Feather N° 16", "feathers");
        settings.Add("feather17", true, "Feather N° 17", "feathers");
        settings.Add("feather18", true, "Feather N° 18", "feathers");
        settings.Add("feather19", true, "Feather N° 19", "feathers");
        settings.Add("feather20", true, "Feather N° 20", "feathers");
    settings.Add("shells", false, "Splitting upon collecting a specified number of shells, regardless of order:");
        settings.Add("shell1", false, "Shell N° 1", "shells");
        settings.Add("shell2", false, "Shell N° 2", "shells");
        settings.Add("shell3", false, "Shell N° 3", "shells");
        settings.Add("shell4", false, "Shell N° 4", "shells");
        settings.Add("shell5", false, "Shell N° 5", "shells");
        settings.Add("shell6", false, "Shell N° 6", "shells");
        settings.Add("shell7", false, "Shell N° 7", "shells");
        settings.Add("shell8", false, "Shell N° 8", "shells");
        settings.Add("shell9", false, "Shell N° 9", "shells");
        settings.Add("shell10", false, "Shell N° 10", "shells");
        settings.Add("shell11", false, "Shell N° 11", "shells");
        settings.Add("shell12", false, "Shell N° 12", "shells");
        settings.Add("shell13", false, "Shell N° 13", "shells");
        settings.Add("shell14", false, "Shell N° 14", "shells");
        settings.Add("shell15", false, "Shell N° 15", "shells");
    settings.Add("sandq", false, "Splitting upon specified Save & Quit locations:");
        settings.Add("Center", false, "Visitor Center", "sandq");
        settings.Add("Frost", false, "Frost Zone", "sandq");
        settings.Add("Outlook", false, "Outlook", "sandq");
        settings.Add("May", false, "Aunt May", "sandq");
        settings.Add("Frog", false, "Sandcastles Frog", "sandq");
    settings.Add("summit", true, "Splitting upon reaching the summit");
    settings.Add("silverFeather", false, "Splitting upon collecting a silver feather");

    vars.createShellsWatcher = (Action<Process>) ((proc) => {
        // scan target to get a pointer to the game's GlobalData singleton class
        var sigScanTarget = new SigScanTarget(37, "C745AC00000000C745B000000000C745B400000000BA????????8BC0E8????????894720BA????????8D6D00E8????????89458C85FF");

        // launch sigscan in background
        ThreadStart startScan = new ThreadStart(() => {
            print("scan started");
            var ptr = IntPtr.Zero;
            foreach (var page in proc.MemoryPages(true))
            {
                var scanner = new SignatureScanner(proc, page.BaseAddress, (int)page.RegionSize);
                if ((ptr = scanner.Scan(sigScanTarget)) != IntPtr.Zero)
                {
                    break;
                }
            }
            if (ptr == IntPtr.Zero)
            {
                print("scan failed, cannot track shells");
            }
            else
            {
                print("scan finished - base address found : 0x" + ptr.ToString("x"));
                vars.shells = new MemoryWatcher<int>(new DeepPointer(ptr, 0x24, 0x4, 0x0, 0xC, 0xC, 0xC, 0xC, 0x2C));
            }
        });

        vars.thread = new Thread(startScan);
        vars.thread.Start();
    });

    vars.squaredDistance = (Func<float[], float[], float>) ((v1, v2) => {
        float res = 0;
        for (int i = 0; i < v1.Length; i++)
        {
            float diff = v2[i] - v1[i];
            res += diff * diff;
        }
        return res; 
    });

    vars.clamp = (Func<float, float, float, float>) ((val, min, max) => {
        return Math.Max(Math.Min(val, max), min);
    });

    vars.checkCircleRectangleCollision = (Func<float, float, float, float, float, float, float, bool>) 
        ((circleCenterX, circleCenterY, circleRadiusSquared, rectCenterX, rectCenterY, rectSizeX, rectSizeY) => {
        float diffX = circleCenterX - rectCenterX;
        float diffY = circleCenterY - rectCenterY;
        float clampedX = vars.clamp(diffX, - rectSizeX, rectSizeX);
        float clampedY = vars.clamp(diffY, - rectSizeY, rectSizeY);
        float closestX = rectCenterX + clampedX;
        float closestY = rectCenterY + clampedY;
        diffX = closestX - circleCenterX;
        diffY = closestY - circleCenterY;
        float lengthSquared = diffX * diffX + diffY * diffY;
        return lengthSquared < circleRadiusSquared;
    });

    vars.copyArray = (Action<Array, Array>) ((src, dst) => {
        if (src != null)
        {
            Buffer.BlockCopy(src, 0, dst, 0, 12);
        }
        else
        {
            for (int i = 0; i < 3; i++)
            {
                dst.SetValue(0.0f, i);
            }
        }
    });
}

init {
    vars.lastValidIGT = 0;
    vars.position = new float[3] { 0.0f, 0.0f, 0.0f };
    vars.lastFeatherCount = 0;
    vars.lastSilverFeatherCount = 0;
    vars.reachedSummit = false;
    vars.shells = null;
    vars.shellsInitialized = false;
}

update {
    vars.copyArray(current.position, vars.position);

    if (!vars.shellsInitialized && vars.position[0] > 0)
    {
        vars.shellsInitialized = true;
        vars.createShellsWatcher(game);
    }

    if (vars.shells != null) { vars.shells.Update(game); }
}

start {
    if (old.startend == 2 && current.startend == 0 && current.igt < 0.1f) {
        vars.lastFeatherCount = 0;
        vars.lastSilverFeatherCount = 0;
        vars.reachedSummit = false;
        return true;
    }
}

split {
    if (old.position == null && current.position != null)
    {
        foreach (var keyValue in vars.SAVE_AND_QUIT_SPLITS)
        {
            bool splitEnabled = settings[keyValue.Key];
            float[] location = keyValue.Value;
            if (splitEnabled && vars.squaredDistance(vars.position, location) < 10.0f)
            {
                return true;
            }
        }
    }

    // note : increased player radius to avoid undetected collisions
    bool isAtSummit =   
        vars.position[1] < vars.SUMMIT[1] + vars.SUMMIT_SIZE[1] + vars.PLAYER_HEIGHT / 2 && 
        vars.position[1] > vars.SUMMIT[1] - vars.SUMMIT_SIZE[1] - vars.PLAYER_HEIGHT / 2 && 
        vars.checkCircleRectangleCollision(
            vars.position[0], vars.position[2], vars.PLAYER_RADIUS_SQUARED * 6.0f,      
            vars.SUMMIT[0], vars.SUMMIT[2], vars.SUMMIT_SIZE[0], vars.SUMMIT_SIZE[2]
        );
       
    if (isAtSummit && !vars.reachedSummit && settings["summit"])
    {
        vars.reachedSummit = true;
        return true;
    }

    if (vars.lastFeatherCount == current.feather - 1) {
        vars.lastFeatherCount = current.feather;
        return settings["feather" + current.feather.ToString()];
    }

    if (vars.lastSilverFeatherCount == current.silverFeathers - 1) {
        vars.lastSilverFeatherCount = current.silverFeathers;
        return settings["silverFeather"];
    }

    return
        (old.startend == 0 && current.startend == 2 && current.igt > 0) ||
        (vars.shells != null && vars.shells.Changed && vars.shells.Old < vars.shells.Current && settings["shell" + vars.shells.Current.ToString()]); 
}

reset {
    return old.startend == 0 && current.startend == 2 && current.igt < 0.1f;
}

isLoading {
    return true;
}

gameTime {
    if (current.igt != 0)
    {
        vars.lastValidIGT = current.igt;
        return TimeSpan.FromSeconds(current.igt);
    }
    else
    {
        return TimeSpan.FromSeconds(vars.lastValidIGT);
    }
}
