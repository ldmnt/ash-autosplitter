state("AShortHike") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "A Short Hike";

    vars.Helper.Settings.CreateFromXml("Components/AShortHike.Settings.xml");

    vars.SnQLocations = new Dictionary<string, Vector3f>
    {
        { "Beach Hut", new Vector3f(471.97f,  25.90f, 114.54f) },
        {      "Frog", new Vector3f(340.32f,  22.49f,  73.08f) },
        {    "Center", new Vector3f(157.98f,  32.20f, 122.22f) },
        {     "Frost", new Vector3f(253.64f, 323.10f, 587.81f) },
        {   "Outlook", new Vector3f(266.04f, 253.27f, 347.58f) },
        {  "Aunt May", new Vector3f(611.85f,  27.89f, 299.51f) }
    };

    vars.NewGamePosition = new Vector3f(657.4f, 21.0f, 354.1f);

    vars.Helper.AlertGameTime();
}

onStart
{
    foreach (var cache in vars.Tags.Values)
        cache.Clear();
}

init
{
    vars.Tags = new Dictionary<string, dynamic>
    {
        { "bools", new Dictionary<string, bool>() },
        // { "ints", new Dictionary<string, int>() },
        { "floats", new Dictionary<string, float>() },
        // { "strings", new Dictionary<string, string>() }
    };

    vars.Helper.TryLoadTimeout = 5000;
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
        var gsl = mono["GameServiceLocator", 2];
        if (gsl.Static == IntPtr.Zero)
            return false;

        var gmd = mono["GameData"];
        var st = mono["Singleton_1"];
        var gbd = mono["GlobalData", 1];
        var tg = mono["Tags"];

        var asl = mono["AbstractServiceLocator_1"];
        var lc = mono["LevelController"];
        var pl = mono["Player"];

        var dct = mono["mscorlib", "Dictionary_2"];

        vars.Helper["StartPosition"] = vars.Helper.Make<Vector3f>(
            gsl.Static + st["_instance"],
            asl["cachedSceneServices"],
            dct["_entries"], 0x1C,
            lc["player"], pl["startPosition"]);

        vars.Helper["InGameTime"] = vars.Helper.Make<float>(
            gsl.Static + st["_instance"],
            asl["cachedSceneServices"],
            dct["_entries"], 0x1C,
            lc["elapsedGameTime"]);

        vars.Helper["GoldenFeathers"] = vars.Helper.Make<int>(
            gsl.Static + st["_instance"],
            asl["cachedSceneServices"],
            dct["_entries"], 0x1C,
            lc["player"], pl["_maxFeathers"]);

        vars.Helper["SilverFeathers"] = vars.Helper.Make<int>(
            gsl.Static + st["_instance"],
            asl["cachedSceneServices"],
            dct["_entries"], 0x1C,
            lc["player"], pl["silverFeathers"]);

        vars.GetChangedTags = (Func<List<string>>)(() =>
        {
            var changedTags = new List<string>();
            var tags = vars.Helper.Read<IntPtr>(gbd.Static + st["_instance"], gbd["_gameData"], gmd["tags"]);

            foreach (var entry in vars.Tags)
            {
                var tagName = entry.Key;
                var cache = entry.Value;

                IntPtr entries = vars.Helper.Read<IntPtr>(tags + tg[tagName], 0xC) + 0x10;
                int count = vars.Helper.Read<int>(tags + tg[tagName], 0x20);

                for (int i = 0; i < count; ++i)
                {
                    IntPtr slot = entries + 0x10 * i;

                    string key = vars.Helper.ReadString(slot + 0x8);

                    dynamic value = null;
                    if (tagName == "bools") value = vars.Helper.Read<bool>(slot + 0xC);
                    else if (tagName == "ints") value = vars.Helper.Read<int>(slot + 0xC);
                    else if (tagName == "floats") value = vars.Helper.Read<float>(slot + 0xC);
                    else if (tagName == "strings") value = vars.Helper.ReadString(slot + 0xC);

                    if (!cache.ContainsKey(key) || cache[key] != value)
                    {
                        cache[key] = value;
                        changedTags.Add(key + ":" + value);
                    }
                }
            }

            return changedTags;
        });

        return true;
    });
}

start
{
    return old.InGameTime == 0.000f && current.InGameTime > 0.000f;
}

split
{
    if (!old.StartPosition.Equals(current.StartPosition))
    {
        foreach (var loc in vars.SnQLocations)
            if (current.StartPosition.Distance(loc.Value) < 10.0f)
                return settings[loc.Key];
    }

    foreach (var tag in vars.GetChangedTags())
        if (settings.ContainsKey(tag) && settings[tag])
            return true;
}

reset
{
    return !old.StartPosition.Equals(current.StartPosition)
        && current.StartPosition.Distance(vars.NewGamePosition) < 10.0f;
}

gameTime
{
    if (current.InGameTime > 0.000f)
        return TimeSpan.FromSeconds(current.InGameTime);
}

isLoading
{
    return true;
}
