state("AShortHike") {}

startup
{
	dynamic[,] SettingsArray =
	{
		{ "Golden Feathers", "Visitor Center Feather 1",                   false, "Visitor Ranger 1" },
		{ "Golden Feathers", "Visitor Center Feather 2",                   false, "Visitor Ranger 2" },
		{ "Golden Feathers", "COLLECTED_0956cf5d8586a8c45a503e8b0dc7cc83", false, "Visitor Center Rock" },
		{ "Golden Feathers", "COLLECTED_633da0aac2fa298499319db80b2028ec", false, "Sand Castle" },
		{ "Golden Feathers", "COLLECTED_84012f6bc2a426549be0af950cdcabec",  true, "Blackwood Forest" },
		{ "Golden Feathers", "Opened_3e81f8b34ebda554b89075f6a81e828c",    false, "\'In Her Shadow\' Treasure" },
		{ "Golden Feathers", "Opened_1dae0d07a28e78b4fa45a6f48bd3445d",    false, "Lighthouse" },
		{ "Golden Feathers", "College Kid Feather 1",                      false, "College Kid 1" },
		{ "Golden Feathers", "College Kid Feather 2",                      false, "College Kid 2" },
		{ "Golden Feathers", "College Kid Feather 3",                      false, "College Kid 3" },
		{ "Golden Feathers", "College Kid Feather 4",                      false, "College Kid 4" },
		{ "Golden Feathers", "$GotVolleyPrize",                            false, "Beachstickball" },
		{ "Golden Feathers", "Opened_204fedd6851cf1b499e8a2254ce575ae",    false, "North Cliff" },
		{ "Golden Feathers", "$BeatFirstBoatTime",                         false, "Boat Challenge" },
		{ "Golden Feathers", "COLLECTED_b38bb329e8652fc40919e61d8d15b1c5", false, "Meteor Lake Cliff" },
		{ "Golden Feathers", "Opened_3347701a297401440b9483786d455244",    false, "Stone Tower" },
		{ "Golden Feathers", "COLLECTED_46ee70a4d733fdb49a823a795627075f", false, "Outlook Cliff" },
		{ "Golden Feathers", "Opened_c9b2b58930bcd114fb6eaa0cc25e5335",    false, "Outlook" },
		{ "Golden Feathers", "Artist Feather 1",                           false, "Artist (beware Visitor Center Artist)" },
		{ "Golden Feathers", "Aunt May Feather 1",                         false, "Aunt May" },

		{ "Silver Feathers", "COLLECTED_f8641be47d809d14ab440622b012cff6", false, "Secret Island" },
		{ "Silver Feathers", "Goat Feather 1",                             false, "Wristwatch Goat" },

		{ "Shells", "IntCollect_b7628b60c3f46114490de46ef99a1971", false, "Start Beach" },
		{ "Shells", "IntCollect_4861cc8aaaf748a488dafa544e9e6d79", false, "Beach Hut" },
		{ "Shells", "IntCollect_455b2e21decfdc94a9f998ae16729d31", false, "Beach Umbrella" },
		{ "Shells", "IntCollect_ad9207612b5eb894cb16415f2681fa82", false, "Sid Beach Mound" },
		{ "Shells", "IntCollect_c2c2347627105bf4da08b948f6fc8ac2", false, "Sid Beach" },
		{ "Shells", "IntCollect_3e97db0704ee4e146b04087e245c5218", false, "Shirley's Point South" },
		{ "Shells", "IntCollect_cff508b7ecb9d964e8f7311cab2f7283", false, "Shirley's Point North" },
		{ "Shells", "IntCollect_c3e380e8e2855214ab426338e20e6abd", false, "Visitor Center Beach" },
		{ "Shells", "IntCollect_c378c5e8fc364184c89e8044c4dd69f6", false, "West River South" },
		{ "Shells", "IntCollect_2c76fbcc0aa5ec1449bb7dee581c5275", false, "West River North" },
		{ "Shells", "IntCollect_8fa998d3401359145b8b7ed720d6ee9d", false, "Stone Tower" },
		{ "Shells", "IntCollect_6a858a484376bd84b828421a937acf34", false, "North Beach" },
		{ "Shells", "IntCollect_a45902a38f1550646b024b588f2ba8f8", false, "North Coast" },
		{ "Shells", "IntCollect_b27827c9dd2da7d45abe29435ca81623", false, "Boat Isle" },
		{ "Shells", "IntCollect_e52c0d5cc1c7e4746b52dcb000068ab9", false, "Boat Cliff" },
		{ "Shells", "IntCollect_51c0a55cd92995e47b6eb9cfc40f2cc0", false, "East Coast" },
		{ "Shells", "IntCollect_b79e697113b5dd449b9c19c501265d55", false, "House North Beach" },
		{ "Shells", "IntCollect_a75dc1d4e16e90e42afcdb46d0346e01", false, "Meteor Lake" },
		{ "Shells", "IntCollect_04057352c021ffd4b956bde04562e467", false, "Good Creek Path Cliff" },
		{ "Shells", "IntCollect_47d61fdcc703f46429f92c8ff913be91", false, "Airstream Island North" },
		{ "Shells", "IntCollect_e3bfacd18e1b01b4ea89ee39293dd06f", false, "Airstream Island South" },
		{ "Shells", "IntCollect_a4014d703e1da8649ad42b11b7ee7550", false, "Secret Island" },

		{ "Chests", "Opened_4dd13ff50a718a444a97988513bc849a", false, "Blackwood Cliff (13)" },
		{ "Chests", "Opened_393ba302a07d3e543b11bb1a50eff38f", false, "Good Creek Path (7)" },
		{ "Chests", "Opened_d2669396136ec93478cfa35f25ba481e", false, "Good Creek Path Cliff (33)" },
		{ "Chests", "Opened_0775a498d83d0094cb3ee40e2864bc0a", false, "Bucket Cliff (33)" },

		{ "Flowers", "Sapling2ab5ae5679c083b46b10db552f05b13c", false, "Bucket" },
		{ "Flowers", "Sapling7040b254cd00d5949a4da916a35100c4", false, "Hawk Peak 1" },
		{ "Flowers", "Sapling58e0151c0ab326c488298ced113244da", false, "Hawk Peak 2" },
		{ "Flowers", "Sapling022cbfea8fc20a448854752645832907", false, "Hawk Peak 3" },

		{ "Artists", "Artist1Talk", false, "Beach" },
		{ "Artists", "Artist2Talk", false, "Lighthouse" },
		{ "Artists", "Artist3Talk", false, "Fast River" },
		{ "Artists", "Artist4Talk", false, "Graveyard" },
		{ "Artists", "Artist5Talk", false, "Outlook" },
		{ "Artists", "Artist6Talk", false, "Visitor Center (beware Artist Feather)" },

		{ "Miscellaneous Items", "IntCollect_d1382c47ed8c270428cfce6cf0e7cd56", false, "Toy Shovel (Beach Cliff)" },
		{ "Miscellaneous Items", "GotShovel",                                   false, "Shovel" },
		{ "Miscellaneous Items", "PROMPT_ShellNecklace",                        false, "Shell Necklace" },
		{ "Miscellaneous Items", "PROMPT_BoatKey",                              false, "Boat Key" },
		{ "Miscellaneous Items", "PROMPT_GoldenFishingRod",                     false, "Golden Fishing Rod" },
		{ "Miscellaneous Items", "PROMPT_Watch",                                false, "Wristwatch" },
		{ "Miscellaneous Items", "PROMPT_RunningShoes",                         false, "Running Shoes" },
		{ "Miscellaneous Items", "PROMPT_ParkHat",                              false, "Provincial Park Hat" },
		{ "Miscellaneous Items", "$GotVolleyPrize3",                            false, "Baseball Hat" },
		{ "Miscellaneous Items", "PROMPT_Sunhat",                               false, "Sunhat" },

		{ "Miscellaneous Actions", "MountainTopCutscene", true, "Reach Summit" },
		{ "Miscellaneous Actions", "WonGameNiceJob",      true, "Finish Game" }
	};

	settings.Add("Golden Feathers", true);
	settings.Add("Silver Feathers", false);
	settings.Add("Shells", false);
	settings.Add("Chests", false);
	settings.Add("Flowers", false);
	settings.Add("Artists", false);
	settings.Add("Miscellaneous Items", false);
	settings.Add("Miscellaneous Actions", true);
		settings.Add("sq", false, "Save & Quit", "Miscellaneous Actions");

	for (int i = 0; i < SettingsArray.GetLength(0); ++i)
	{
		string parent      = SettingsArray[i, 0];
		string id          = SettingsArray[i, 1];
		bool state         = SettingsArray[i, 2];
		string description = SettingsArray[i, 3];

		settings.Add(id, state, description, parent);
	}

	vars.SnQLocations = new Dictionary<string, Vector3f>() {
		{ "Beach Hut", new Vector3f(471.97f,  25.90f, 114.54f) },
		{      "Frog", new Vector3f(340.32f,  22.49f,  73.08f) },
		{    "Center", new Vector3f(157.98f,  32.20f, 122.22f) },
		{     "Frost", new Vector3f(253.64f, 323.10f, 587.81f) },
		{   "Outlook", new Vector3f(266.04f, 253.27f, 347.58f) },
		{  "Aunt May", new Vector3f(611.85f,  27.89f, 299.51f) }
	};

	foreach (var loc in vars.SnQLocations)
		settings.Add(loc.Key, false, loc.Key, "sq");

	vars.TimerStart = (EventHandler) ((s, e) => {
		vars.PosFeathers = new Dictionary<string, Tuple<Vector3f, int>> {
			{ "Visitor Center", Tuple.Create(new Vector3f(179.45f,  32.22f, 0f), 0) },
			{    "College Kid", Tuple.Create(new Vector3f(255.85f, 267.25f, 0f), 0) },
			{         "Artist", Tuple.Create(new Vector3f(193.28f,  32.26f, 0f), 0) },
			{       "Aunt May", Tuple.Create(new Vector3f(653.73f,  20.41f, 0f), 0) },
			{           "Goat", Tuple.Create(new Vector3f(277.14f,  11.94f, 0f), 0) }
		};
	});
	timer.OnStart += vars.TimerStart;

	vars.TimerStart(null, null);
	vars.Stopwatch = new Stopwatch();
}

init
{
	vars.GetInfo = (Func<int, int, string>) ((entryIndex, typeIndex) =>
	{
		Func<bool, bool, IntPtr> dPtr = (isKey, isString) => {
			IntPtr ptr = IntPtr.Zero;
			new DeepPointer(vars.DictsBase, 0xC, 0xC, 0x8 + 0x4 * typeIndex, 0xC, (isKey ? 0x18 : 0x1C) + 0x10 * entryIndex)
			.DerefOffsets(game, out ptr);

			if (isString) new DeepPointer(ptr, 0xC).DerefOffsets(game, out ptr);

			return ptr;
		};

		string name = game.ReadString(dPtr(true, true), 128);

		switch (typeIndex)
		{
			case 0: return name;
			case 1: return name + ":" + game.ReadValue<int>(dPtr(false, false));
			case 2: return name + ":" + game.ReadValue<float>(dPtr(false, false));
			case 3: return name + ":" + game.ReadString(dPtr(false, true), 128);
			default: return String.Empty;
		}
	});

	#region SigScanning
	ProcessModuleWow64Safe Module = modules.FirstOrDefault(x => x.ModuleName.Equals("UnityPlayer.dll"));
	SignatureScanner ModuleScanner = new SignatureScanner(game, Module.BaseAddress, Module.ModuleMemorySize);

	SigScanTarget[] Signatures = {
		new SigScanTarget(2, "8B 35 ?? ?? ?? ?? 85 F6 75 ?? 68 ?? ?? ?? ?? 6A 18"),
		new SigScanTarget(2, "8B 0D ?? ?? ?? ?? 8B 19 8B C3 8B 7B ?? 80 7F ?? 00 75 ?? 8B F1 90"),
		new SigScanTarget(2, "8B 3D ?? ?? ?? ?? 33 D2 8B 4F")
	};

	IntPtr[] Addresses = new IntPtr[3];

	vars.SigsFound = false;
	vars.Stopwatch.Start();
	while (!vars.SigsFound)
	{
		for (int i = 0; i < Addresses.Length; ++i)
			Addresses[i] = game.ReadPointer(ModuleScanner.Scan(Signatures[i]));

		vars.SigsFound = Addresses.All(x => x != IntPtr.Zero);

		if (vars.Stopwatch.ElapsedMilliseconds >= 15000) break;
	}
	vars.Stopwatch.Reset();
	#endregion

	if (vars.SigsFound)
	{
		new DeepPointer(Addresses[0], 0xEC4, 0x64, 0x1BC, 0xF8).DerefOffsets(game, out Addresses[0]);
		vars.DictsBase = Addresses[0];

		vars.DictCount = new MemoryWatcherList
		{
			new MemoryWatcher<int>(new DeepPointer(vars.DictsBase, 0xC, 0xC, 0x8, 0x20)) { Name = "bools" },
			//new MemoryWatcher<int>(new DeepPointer(vars.DictsBase, 0xC, 0xC, 0xC, 0x20)) { Name = "ints" },
			//new MemoryWatcher<int>(new DeepPointer(vars.DictsBase, 0xC, 0xC, 0x10, 0x20)) { Name = "floats" },
			//new MemoryWatcher<int>(new DeepPointer(vars.DictsBase, 0xC, 0xC, 0x14, 0x20)) { Name = "strings" }
		};

		vars.PlayerInfo = new MemoryWatcherList
		{
			new MemoryWatcher<Vector3f>(new DeepPointer(Addresses[2], 0x0, 0x14, 0xBD8, 0x74)) { Name = "position" },
			new MemoryWatcher<float>(new DeepPointer(Addresses[1], 0x44, 0x4, 0x14, 0x0, 0x8, 0x18, 0x30)) { Name = "igt" },
			new MemoryWatcher<int>(new DeepPointer(Addresses[1], 0x44, 0x4, 0x14, 0x0, 0x8, 0x18, 0x24, 0x254)) { Name = "gFeathers" },
			new MemoryWatcher<int>(new DeepPointer(Addresses[1], 0x44, 0x4, 0x14, 0x0, 0x8, 0x18, 0x24, 0x290)) { Name = "sFeathers" }
		};
	}
	else
	{
		MessageBox.Show(
			"Signature scan timed out!\n" +
			"Please contact Ero#6117 or Hamb#4409 on Discord.",
			"LiveSplit | A Short Hike Auto Splitter",
			MessageBoxButtons.OK, MessageBoxIcon.Error
		);
	}
}

update
{
	if (!vars.SigsFound) return false;

	vars.DictCount.UpdateAll(game);
	vars.PlayerInfo.UpdateAll(game);

	current.PlayerPos = vars.PlayerInfo["position"].Current;

	current.PosIsNull = new[] {
		current.PlayerPos.X,
		current.PlayerPos.Y,
		current.PlayerPos.Z
	}.All(x => x == 0.000f);
}

start
{
	return vars.DictCount["bools"].Old > 0 && vars.PlayerInfo["igt"].Old == 0.000f && vars.PlayerInfo["igt"].Current > 0.000f;
}

split
{
	bool posWasNull = old.PosIsNull && !current.PosIsNull;
	bool gFeathersIncreased = vars.PlayerInfo["gFeathers"].Old < vars.PlayerInfo["gFeathers"].Current;
	bool sFeathersIncreased = vars.PlayerInfo["sFeathers"].Old < vars.PlayerInfo["sFeathers"].Current;

	if (posWasNull)
	{
		foreach (var location in vars.SnQLocations)
			if (current.PlayerPos.Distance(location.Value) < 10.0f)
				return settings[location.Key];
	}

	if (gFeathersIncreased || sFeathersIncreased)
	{
		string id;
		int newFeathers;
		foreach (var location in vars.PosFeathers)
		{
			if (current.PlayerPos.DistanceXY(location.Value.Item1) < 100.0f)
			{
				id = location.Key;
				newFeathers = location.Value.Item2 + 1;
				vars.PosFeathers[id] = Tuple.Create(location.Value.Item1, newFeathers);
				return settings[id + " Feather " + newFeathers];
			}
		}
	}

	foreach (var count in vars.DictCount)
	{
		if (count.Changed)
		{
			if (count.Current == 0)
			{
				count.Current = count.Old;
			}
			else
			{
				int typeIndex = Array.IndexOf(new[] { "bools", "ints", "floats", "strings" }, count.Name);
				for (int i = count.Old; i <= count.Current - 1; ++i)
				{
					string entryInfo = vars.GetInfo(i, typeIndex);
					if (String.IsNullOrEmpty(entryInfo)) continue;

					print("Setting: " + entryInfo);
					if (settings.ContainsKey(entryInfo) && settings[entryInfo]) return true;
				}
			}
		}
	}
}

reset
{
	return old.PosIsNull && !current.PosIsNull && vars.PlayerInfo["igt"].Current == 0.000f;
}

gameTime
{
	if (vars.PlayerInfo["igt"].Current > 0 && !current.PosIsNull)
	{
		return TimeSpan.FromSeconds(vars.PlayerInfo["igt"].Current);
	}
}

isLoading
{
	return true;
}

shutdown
{
	timer.OnStart -= vars.TimerStart;
}
