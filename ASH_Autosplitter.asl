state("AShortHike") {
	int boolsCount   : "UnityPlayer.dll", 0x12B8AA0, 0x54, 0x1958, 0xC, 0xC, 0x8, 0x20;
	int intsCount    : "UnityPlayer.dll", 0x12B8AA0, 0x54, 0x1958, 0xC, 0xC, 0xC, 0x20;
	int floatsCount  : "UnityPlayer.dll", 0x12B8AA0, 0x54, 0x1958, 0xC, 0xC, 0x10, 0x20;
	int stringsCount : "UnityPlayer.dll", 0x12B8AA0, 0x54, 0x1958, 0xC, 0xC, 0x14, 0x20;

	float xPos : "UnityPlayer.dll", 0x1256980, 0x0, 0x14, 0x4DC, 0x1C8, 0x74;
	float yPos : "UnityPlayer.dll", 0x1256980, 0x0, 0x14, 0x4DC, 0x1C8, 0x78;
	float zPos : "UnityPlayer.dll", 0x1256980, 0x0, 0x14, 0x4DC, 0x1C8, 0x7C;

	int levelControllerAddr : "UnityPlayer.dll", 0x1284800, 0x4, 0x4, 0x14, 0x0, 0x8, 0x18;
	float igt               : "UnityPlayer.dll", 0x1284800, 0x4, 0x4, 0x14, 0x0, 0x8, 0x18, 0x30;
	int gFeathers           : "UnityPlayer.dll", 0x1284800, 0x4, 0x4, 0x14, 0x0, 0x8, 0x18, 0x24, 0x254;
	int sFeathers           : "UnityPlayer.dll", 0x1284800, 0x4, 0x4, 0x14, 0x0, 0x8, 0x18, 0x24, 0x290;
}

startup {
	object[,] settingsArray = {
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

	// Add parent settings.
	settings.Add("Golden Feathers", true);
	settings.Add("Silver Feathers", false);
	settings.Add("Shells", false);
	settings.Add("Chests", false);
	settings.Add("Flowers", false);
	settings.Add("Artists", false);
	settings.Add("Miscellaneous Items", false);
	settings.Add("Miscellaneous Actions", true);
		settings.Add("sq", false, "Save & Quit", "Miscellaneous Actions");

	// Loop over the nested array, cast objects to specific types, create settings.
	for (int i = 0; i < settingsArray.GetLength(0); ++i) {
		string parent = (string)settingsArray[i, 0];
		string id = (string)settingsArray[i, 1];
		bool state = (bool)settingsArray[i, 2];
		string description = (string)settingsArray[i, 3];

		settings.Add(id, state, description, parent);
	}

	// Various save & quit target locations, partly by Hambinou.
	vars.saveAndQuitLocations = new Dictionary<string, float[]>() {
		{ "Beach Hut", new[] { 471.97f,  25.90f, 114.54f } },
		{      "Frog", new[] { 340.32f,  22.49f,  73.08f } },
		{    "Center", new[] { 157.98f,  32.20f, 122.22f } },
		{     "Frost", new[] { 253.58f, 319.51f, 587.67f } },
		{   "Outlook", new[] { 266.04f, 253.27f, 347.58f } },
		{  "Aunt May", new[] { 611.85f,  27.89f, 299.51f } }
	};

	// Add locations to settings.
	foreach (var loc in vars.saveAndQuitLocations)
		settings.Add(loc.Key, false, loc.Key, "sq");

	// By Hambinou. Used to calculate the distance between the player and a point in 3D space.
	vars.squaredDistance = (Func<float[], float[], float>) ((v1, v2) => {
		float res = 0;
		for (int i = 0; i < v1.Length; ++i) {
			float diff = v2[i] - v1[i];
			res += diff * diff;
		}

		return res;
	});

	// Since we can't rely on the user going through the start{} block, we create an EventHandler
	// that timer.OnStart is subscribed to.
	vars.timerStart = (EventHandler) ((s, e) => {
		vars.savedIGT = null;
		vars.allCounts = new int[4];
		vars.positionBasedFeathers = new Dictionary<string, Tuple<float[], int>> {
			{ "Visitor Center", Tuple.Create(new[] { 179.45f,  32.22f, 125.85f }, 0) },
			{    "College Kid", Tuple.Create(new[] { 255.85f, 267.25f, 567.41f }, 0) },
			{         "Artist", Tuple.Create(new[] { 193.28f,  32.26f,  98.83f }, 0) },
			{       "Aunt May", Tuple.Create(new[] { 653.73f,  20.41f, 331.81f }, 0) },
			{           "Goat", Tuple.Create(new[] { 277.14f,  11.94f, 139.97f }, 0) }
		};
	});
	timer.OnStart += vars.timerStart;

	// vars.positionBasedFeathers doesn't exist until the EventHandler's code has run at least once.
	vars.timerStart(null, null);
	vars.stopWatch = new Stopwatch();

	timer.CurrentTimingMethod = TimingMethod.GameTime;
}

init {
	// Global fields to track certain things.
	current.isPlaying = false;
	current.allCounts = new int[4];

	// Function to return an IntPtr based off of fed information.
	// Important here: Our data is stored in 4 Dictionaries within GlobalData.GameData.tags; bools, ints, floats, strings.
	// This makes accessing it fairly easy and we merely need to change some offsets in a pointer path.
	vars.makePtr = (Func<int, int, string, IntPtr>) ((entryIndex, typeIndex, nameOrValue) => {
		Dictionary<string, int> offset = new Dictionary<string, int> {
			{ "name", 0x18 },
			{ "value", 0x1C }
		};

		IntPtr ptr = IntPtr.Zero;
		new DeepPointer("UnityPlayer.dll", 0x12B8AA0, 0x54, 0x1958, 0xC, 0xC, 0x8 + 0x4 * typeIndex, 0xC, offset[nameOrValue] + 0x10 * entryIndex).DerefOffsets(game, out ptr);
		if (nameOrValue == "name" || typeIndex == 3 && nameOrValue == "value") new DeepPointer(ptr, 0xC).DerefOffsets(game, out ptr);

		return ptr;
	});

	// When the player quits to the menu, the igt pointer is lost and its value drops to 0.
	// To combat this, we use an entry in GlobalData.GameData.tags.floats called "SpeedRunTime".
	// This time is updated when the game is saved. Is the player not in-game, use this value.
	// To note: since the entry isn't always in the same spot (GlobalData.GameData.tags.floats starts out empty),
	// we need to loop over all entries until we find the "SpeedRunTime" one.
	vars.updIGTWatcher = (Action) (() => {
		IntPtr name, value;
		for (int i = 0; i < current.floatsCount; ++i) {
			name = vars.makePtr(i, 2, "name");
			value = vars.makePtr(i, 2, "value");
			if (memory.ReadString(name, 12) == "SpeedRunTime") {
				vars.savedIGT = new MemoryWatcher<float>(value);
				break;
			}
		}
	});

	// This function gets an entry's name at a given index within a given type's Dictionary.
	vars.dictSplitFunc = (Func<int, int, bool>) ((entryIndex, typeIndex) => {
		//typeIndices: 0 = bool, 1 = int, 2 = float, 3 = string

		IntPtr name = vars.makePtr(entryIndex, typeIndex, "name"), value = vars.makePtr(entryIndex, typeIndex, "value");
		string recentEntry = memory.ReadString(name, 128);
		//print("\n" + recentEntry);

		return settings.ContainsKey(recentEntry) && settings[recentEntry];
	});

	// The user may load the script when already in-game. We need to find the "SpeedRunTime" entry
	// already so no mess-up can occur.
	vars.updIGTWatcher();
}

update {
	if (old.floatsCount == 0 && current.floatsCount > 0) vars.updIGTWatcher();
	if (vars.savedIGT != null) vars.savedIGT.Update(game);
	current.isPlaying = current.levelControllerAddr > 0; // Simply for readability.

	// Currently, only booleans are important to us. Since this may change in the future, I've kept it like this.
	current.allCounts = new int[] { current.boolsCount/*, current.intsCount, current.floatsCount, current.stringsCount*/ };
}

start {
	// If the player is on a fresh file and igt increases from 0.
	return current.floatsCount == 0 && current.isPlaying && old.igt == 0.000f && current.igt > 0f;
}

split {
	// If the player is not currently in-game, no split code needs to run.
	if (!current.isPlaying) return;

	// I've noticed some delay between this change and the position updating.
	// I wait 0.005 seconds here to then do the regular distance check for S&Q locations.
	if (!old.isPlaying && current.isPlaying) vars.stopWatch.Start();
	if (vars.stopWatch.ElapsedMilliseconds >= 50) {
		vars.stopWatch.Reset();
		float[] playerPos = new float[] { current.xPos, current.yPos, current.zPos };
		foreach (var location in vars.saveAndQuitLocations)
			if (vars.squaredDistance(playerPos, location.Value) < 10.0f)
				return settings[location.Key];
	}

	// Unfortunately, items acquired during dialog do not get written to any of the Dictionaries.
	// (Progress is tracked by the dialog following the unlock. I'd like to avoid splitting on that,
	// as it does not represent the actual acquisition of the item, even if the player may mash.)
	// When the player's feather count increases, their position is compared to any of those within
	// vars.positionBasedFeathers. If the player is within 100 units of one of those, increase
	// the count and split if the setting is checked accordingly.
	if (old.gFeathers < current.gFeathers || old.sFeathers < current.sFeathers) {
		float[] playerPos = new float[] { current.xPos, current.yPos, current.zPos };
		string id;
		int newFeathers;
		foreach (var location in vars.positionBasedFeathers) {
			if (vars.squaredDistance(playerPos, location.Value.Item1) < 100.0f) {
				id = location.Key;
				newFeathers = location.Value.Item2 + 1;
				vars.positionBasedFeathers[id] = Tuple.Create(location.Value.Item1, newFeathers);
				return settings[id + " Feather " + newFeathers];
			}
		}
	}

	// If the array changes (any index), loop over the indices and check if the entry increased
	// between iterations. If true, loop over all new entries, and return true if the entry's
	// name exists in the settings and the setting is checked by the user.
	if (old.allCounts != current.allCounts)
		for (int type = 0; type < current.allCounts.Length; ++type)
			if (current.allCounts[type] > old.allCounts[type])
				for (int j = old.allCounts[type] + 1; j <= current.allCounts[type]; ++j)
					if (vars.dictSplitFunc(j - 1, type)) return true;
}

reset {
	// isPlaying resets when the user starts a new game. Only if igt was also set to 0, reset.
	return !old.isPlaying && current.isPlaying && current.igt == 0.000f;
}

gameTime {
	// If the player is in-game, return current.igt, if not, return the saved igt from the floats Dictionary.
	if (current.isPlaying) return TimeSpan.FromSeconds(current.igt);
	else if (vars.savedIGT != null) return TimeSpan.FromSeconds(vars.savedIGT.Current);
}

isLoading {
	return true;
}

shutdown {
	// Unsubscribe timer.OnStart from vars.timerStart, to eliminate the possibility of
	// that code running when the user stops running this game.
	timer.OnStart -= vars.timerStart;
}
