state("AShortHike") {
    int feather          : "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x234;
    // int silverFeathers: "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x270;
    byte12 position      : "UnityPlayer.dll", 0x109AC54, 0x38, 0x34, 0x3C, 0x44, 0x8, 0x1C, 0x1C, 0x4, 0x18, 0x8, 0x20, 0x10, 0x30;
    int screen           : "UnityPlayer.dll", 0x105C480, 0x3C;
    float igt            : "UnityPlayer.dll", 0x10B6780, 0x4, 0x4, 0x14, 0x0, 0x48, 0x18, 0x28;
    int shells           : "mono-2.0-bdwgc.dll", 0x39B56C, 0xFE4, 0xC, 0xC, 0xC, 0xC, 0x2C;
    bool gameRunning     : "mono-2.0-bdwgc.dll", 0x39B56C, 0xFE4, 0x10, 0x10, 0x24;
}

startup {
    // coordinates to check against the player location after save and quits
    vars.SAVE_AND_QUIT_SPLITS = new Dictionary<string, float[]>() {
        { "Outlook", new float[3] { 266.04f, 253.27f, 347.58f } },
        { "Center", new float[3] { 157.98f, 32.20f, 122.22f } },
        { "Frost", new float[3] { 253.58f, 319.51f, 587.67f } },
        { "May", new float[3] { 611.85f, 27.89f, 299.51f } }
    };

    // player collision capsule
    vars.PLAYER_HEIGHT = 1.923962f;
    vars.PLAYER_RADIUS_SQUARED = 0.16f;

    // summit area description (rectangular box defined by its center and half extents)
    vars.SUMMIT = new float[3] { 399.8647f, 606.32938f, 795.0003f };
    vars.SUMMIT_SIZE = new float[3] { 7.326245f, 7.15712f, 4.547681f };

    settings.Add("splits", true, "Choose your splits here!");
        settings.Add("feathers", true, "Splitting upon collecting a specified number of feathers, regardless of order:", "splits");
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
        settings.Add("shells", false, "Splitting upon collecting a specified number of shells, regardless of order:", "splits");
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
        settings.Add("sandq", false, "Splitting upon specified Save & Quit locations:", "splits");
            settings.Add("Center", false, "Visitor Center", "sandq");
            settings.Add("Frost", false, "Frost Zone", "sandq");
            settings.Add("Outlook", false, "Outlook", "sandq");
            settings.Add("May", false, "Aunt May", "sandq");
        settings.Add("summit", true, "Splitting upon reaching the summit", "splits");

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
}

init {
    vars.lastValidIGT = 0;
    vars.position = new float[3] { 0.0f, 0.0f, 0.0f };
    vars.lastFeatherCount = 0;
    vars.justSavedAndQuit = false;
    vars.reachedSummit = false;
    vars.currentIAS = false;
}

update {
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
}

start {
    return
        (old.igt == 0 && current.igt > 0 && current.screen == 612) ||
        (old.igt == 0 && current.igt > 0 && current.screen == 516) ||
        (old.igt == 0 && current.igt > 0 && current.screen == 216);
}

split {
    if (!old.gameRunning && current.gameRunning)
    {
        vars.justSavedAndQuit = true;
    }

    if (vars.justSavedAndQuit)
    {
        foreach (var keyValue in vars.SAVE_AND_QUIT_SPLITS)
        {
            bool splitEnabled = settings[keyValue.Key];
            float[] location = keyValue.Value;
            if (splitEnabled && vars.squaredDistance(vars.position, location) < 5.0f)
            {
                vars.justSavedAndQuit = false;
                return true;
            }
        }
        if (vars.position[0] > 0)
        {
            vars.justSavedAndQuit = false;
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

    return
        (current.screen == 96) ||
        (current.screen == 108 && old.screen == 384) ||
        (old.shells < current.shells && settings["shell" + current.shells.ToString()]); 
}

reset {
    if (current.screen == 24)
    {
        vars.lastFeatherCount = 0;
        vars.justSavedAndQuit = false;
        vars.reachedSummit = false;
        return true;
    }
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
