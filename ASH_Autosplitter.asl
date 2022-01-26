state("AShortHike") {}

startup
{
	vars.Log = (Action<object>)((output) => print("[A Short Hike] " + output));

	dynamic[,] settingsArr =
	{
		{ "Golden Feathers", "$FeathersSold:1",                                 false, "Visitor Ranger 1" },
		{ "Golden Feathers", "$FeathersSold:2",                                 false, "Visitor Ranger 2" },
		{ "Golden Feathers", "COLLECTED_0956cf5d8586a8c45a503e8b0dc7cc83:True", false, "Visitor Center Rock" },
		{ "Golden Feathers", "COLLECTED_633da0aac2fa298499319db80b2028ec:True", false, "Sand Castle" },
		{ "Golden Feathers", "COLLECTED_84012f6bc2a426549be0af950cdcabec:True",  true, "Blackwood Forest" },
		{ "Golden Feathers", "Opened_3e81f8b34ebda554b89075f6a81e828c:True",    false, "\'In Her Shadow\' Treasure" },
		{ "Golden Feathers", "Opened_1dae0d07a28e78b4fa45a6f48bd3445d:True",    false, "Lighthouse" },
		{ "Golden Feathers", "$ToughBirdSales:1",                               false, "College Kid 1" },
		{ "Golden Feathers", "$ToughBirdSales:2",                               false, "College Kid 2" },
		{ "Golden Feathers", "$ToughBirdSales:3",                               false, "College Kid 3" },
		{ "Golden Feathers", "$ToughBirdSales:4",                               false, "College Kid 4" },
		{ "Golden Feathers", "$GotVolleyPrize:True",                            false, "Beachstickball" },
		{ "Golden Feathers", "Opened_204fedd6851cf1b499e8a2254ce575ae:True",    false, "North Cliff" },
		{ "Golden Feathers", "$BeatFirstBoatTime:True",                         false, "Boat Challenge" },
		{ "Golden Feathers", "COLLECTED_b38bb329e8652fc40919e61d8d15b1c5:True", false, "Meteor Lake Cliff" },
		{ "Golden Feathers", "Opened_3347701a297401440b9483786d455244:True",    false, "Stone Tower" },
		{ "Golden Feathers", "COLLECTED_46ee70a4d733fdb49a823a795627075f:True", false, "Outlook Cliff" },
		{ "Golden Feathers", "Opened_c9b2b58930bcd114fb6eaa0cc25e5335:True",    false, "Outlook" },
		{ "Golden Feathers", "Artist6Talk:True",                                false, "Artist (beware Visitor Center Artist)" },
		{ "Golden Feathers", "$DeliveredNecklace:True",                         false, "Aunt May" },

		{ "Silver Feathers", "COLLECTED_f8641be47d809d14ab440622b012cff6:True", false, "Secret Island" },
		{ "Silver Feathers", "$GoatWatchFound:True",                            false, "Wristwatch Goat" },

		{ "Shells", "IntCollect_b7628b60c3f46114490de46ef99a1971:True", false, "Start Beach" },
		{ "Shells", "IntCollect_4861cc8aaaf748a488dafa544e9e6d79:True", false, "Beach Hut" },
		{ "Shells", "IntCollect_455b2e21decfdc94a9f998ae16729d31:True", false, "Beach Umbrella" },
		{ "Shells", "IntCollect_ad9207612b5eb894cb16415f2681fa82:True", false, "Sid Beach Mound" },
		{ "Shells", "IntCollect_c2c2347627105bf4da08b948f6fc8ac2:True", false, "Sid Beach" },
		{ "Shells", "IntCollect_3e97db0704ee4e146b04087e245c5218:True", false, "Shirley's Point South" },
		{ "Shells", "IntCollect_cff508b7ecb9d964e8f7311cab2f7283:True", false, "Shirley's Point North" },
		{ "Shells", "IntCollect_c3e380e8e2855214ab426338e20e6abd:True", false, "Visitor Center Beach" },
		{ "Shells", "IntCollect_c378c5e8fc364184c89e8044c4dd69f6:True", false, "West River South" },
		{ "Shells", "IntCollect_2c76fbcc0aa5ec1449bb7dee581c5275:True", false, "West River North" },
		{ "Shells", "IntCollect_8fa998d3401359145b8b7ed720d6ee9d:True", false, "Stone Tower" },
		{ "Shells", "IntCollect_6a858a484376bd84b828421a937acf34:True", false, "North Beach" },
		{ "Shells", "IntCollect_a45902a38f1550646b024b588f2ba8f8:True", false, "North Coast" },
		{ "Shells", "IntCollect_b27827c9dd2da7d45abe29435ca81623:True", false, "Boat Isle" },
		{ "Shells", "IntCollect_e52c0d5cc1c7e4746b52dcb000068ab9:True", false, "Boat Cliff" },
		{ "Shells", "IntCollect_51c0a55cd92995e47b6eb9cfc40f2cc0:True", false, "East Coast" },
		{ "Shells", "IntCollect_b79e697113b5dd449b9c19c501265d55:True", false, "House North Beach" },
		{ "Shells", "IntCollect_a75dc1d4e16e90e42afcdb46d0346e01:True", false, "Meteor Lake" },
		{ "Shells", "IntCollect_04057352c021ffd4b956bde04562e467:True", false, "Good Creek Path Cliff" },
		{ "Shells", "IntCollect_47d61fdcc703f46429f92c8ff913be91:True", false, "Airstream Island North" },
		{ "Shells", "IntCollect_e3bfacd18e1b01b4ea89ee39293dd06f:True", false, "Airstream Island South" },
		{ "Shells", "IntCollect_a4014d703e1da8649ad42b11b7ee7550:True", false, "Secret Island" },

		{ "Chests", "Opened_4dd13ff50a718a444a97988513bc849a:True", false, "Blackwood Cliff (13)" },
		{ "Chests", "Opened_393ba302a07d3e543b11bb1a50eff38f:True", false, "Good Creek Path (7)" },
		{ "Chests", "Opened_d2669396136ec93478cfa35f25ba481e:True", false, "Good Creek Path Cliff (33)" },
		{ "Chests", "Opened_0775a498d83d0094cb3ee40e2864bc0a:True", false, "Bucket Cliff (33)" },

		{ "Flowers", "Sapling2ab5ae5679c083b46b10db552f05b13c:True", false, "Bucket" },
		{ "Flowers", "Sapling7040b254cd00d5949a4da916a35100c4:True", false, "Hawk Peak 1" },
		{ "Flowers", "Sapling58e0151c0ab326c488298ced113244da:True", false, "Hawk Peak 2" },
		{ "Flowers", "Sapling022cbfea8fc20a448854752645832907:True", false, "Hawk Peak 3" },

		{ "Artists", "Artist1Talk:True", false, "Beach" },
		{ "Artists", "Artist2Talk:True", false, "Lighthouse" },
		{ "Artists", "Artist3Talk:True", false, "Fast River" },
		{ "Artists", "Artist4Talk:True", false, "Graveyard" },
		{ "Artists", "Artist5Talk:True", false, "Outlook" },

		{ "Miscellaneous Items", "IntCollect_d1382c47ed8c270428cfce6cf0e7cd56:True", false, "Toy Shovel (Beach Cliff)" },
		{ "Miscellaneous Items", "GotShovel:True",                                   false, "Shovel" },
		{ "Miscellaneous Items", "PROMPT_ShellNecklace:True",                        false, "Shell Necklace" },
		{ "Miscellaneous Items", "PROMPT_BoatKey:True",                              false, "Boat Key" },
		{ "Miscellaneous Items", "PROMPT_GoldenFishingRod:True",                     false, "Golden Fishing Rod" },
		{ "Miscellaneous Items", "PROMPT_Watch:True",                                false, "Wristwatch" },
		{ "Miscellaneous Items", "PROMPT_RunningShoes:True",                         false, "Running Shoes" },
		{ "Miscellaneous Items", "PROMPT_ParkHat:True",                              false, "Provincial Park Hat" },
		{ "Miscellaneous Items", "$GotVolleyPrize3:True",                            false, "Baseball Hat" },
		{ "Miscellaneous Items", "PROMPT_Sunhat:True",                               false, "Sunhat" },

		{ "Miscellaneous Actions", "MountainTopCutscene:True", true, "Reach Summit" },
		{ "Miscellaneous Actions", "WonGameNiceJob:True",      true, "Finish Game" }
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

	for (int i = 0; i < settingsArr.GetLength(0); ++i)
	{
		string parent      = settingsArr[i, 0];
		string id          = settingsArr[i, 1];
		bool state         = settingsArr[i, 2];
		string description = settingsArr[i, 3];

		settings.Add(id, state, description, parent);
	}

	vars.SnQLocations = new Dictionary<string, Vector3f>
	{
		{ "Beach Hut", new Vector3f(471.97f,  25.90f, 114.54f) },
		{      "Frog", new Vector3f(340.32f,  22.49f,  73.08f) },
		{    "Center", new Vector3f(157.98f,  32.20f, 122.22f) },
		{     "Frost", new Vector3f(253.64f, 323.10f, 587.81f) },
		{   "Outlook", new Vector3f(266.04f, 253.27f, 347.58f) },
		{  "Aunt May", new Vector3f(611.85f,  27.89f, 299.51f) }
	};

	foreach (var loc in vars.SnQLocations)
		settings.Add(loc.Key, false, loc.Key, "sq");

	using (var prov = new Microsoft.CSharp.CSharpCodeProvider())
	{
		var param = new System.CodeDom.Compiler.CompilerParameters
		{
			GenerateInMemory = true,
			ReferencedAssemblies = { "LiveSplit.Core.dll", "System.dll", "System.Core.dll", "System.Xml.dll", "System.Xml.Linq.dll" }
		};

		string mono = File.ReadAllText(@"Components\mono.cs"), helpers = File.ReadAllText(@"Components\mono_helpers.cs");
		var asm = prov.CompileAssemblyFromSource(param, mono, helpers);
		foreach (var err in asm.Errors) vars.Log(err);
		vars.Unity = Activator.CreateInstance(asm.CompiledAssembly.GetType("Unity.Game"));
	}
}

onStart
{
	foreach (var value in current.Tags.Values)
		value.Clear();
}

init
{
	vars.Unity.TryOnLoad = (Func<dynamic, bool>)(helper =>
	{
		Func<IntPtr, IntPtr> rp = ptr => game.ReadPointer(ptr);
		Func<IntPtr, int> ri = ptr => game.ReadValue<int>(ptr);
		Func<IntPtr, int, string> rs = (ptr, length) => game.ReadString(ptr, length, "");

		var gsl = helper.GetClass("Assembly-CSharp", 0x20000B0, 2);
		if (gsl.Static == IntPtr.Zero) return false;

		var gmd = helper.GetClass("Assembly-CSharp", 0x200047B);
		var st = helper.GetClass("Assembly-CSharp", 0x2000036);
		var gbd = helper.GetClass("Assembly-CSharp", 0x200008E, 1);
		var tg = helper.GetClass("Assembly-CSharp", 0x2000091);

		var asl = helper.GetClass("Assembly-CSharp", 0x2000031);
		var lc = helper.GetClass("Assembly-CSharp", 0x20000CA);
		var pl = helper.GetClass("Assembly-CSharp", 0x2000072);

		var dct = helper.GetClass("mscorlib", "Dictionary`2");

		vars.Player = new MemoryWatcherList
		{
			new MemoryWatcher<Vector3f>(new DeepPointer(
				gsl.Static + st["_instance"],
				asl["cachedSceneServices"],
				dct["entries"], 0x1C,
				lc["player"], pl["startPosition"])) { Name = "startPos" },

			new MemoryWatcher<float>(new DeepPointer(
				gsl.Static + st["_instance"],
				asl["cachedSceneServices"],
				dct["entries"], 0x1C,
				lc["elapsedGameTime"])) { Name = "igt" },

			new MemoryWatcher<int>(new DeepPointer(
				gsl.Static + st["_instance"],
				asl["cachedSceneServices"],
				dct["entries"], 0x1C,
				lc["player"], pl["_maxFeathers"])) { Name = "gFeathers" },

			new MemoryWatcher<int>(new DeepPointer(
				gsl.Static + st["_instance"],
				asl["cachedSceneServices"],
				dct["entries"], 0x1C,
				lc["player"], pl["silverFeathers"])) { Name = "sFeathers" }
		};

		vars.UpdateTags = (Func<List<string>>)(() =>
		{
			var changedTags = new List<string>();
			var tags = rp(rp(rp(
					gbd.Static + st["_instance"])
					+ gbd["_gameData"])
					+ gmd["tags"]
			);

			foreach (var tag in new[] { "bools"/*, "ints"*/, "floats"/*, "strings"*/ })
			{
				var dict = rp(tags + tg[tag]);
				var count = ri(dict + 0x20);
				var entries = rp(dict + 0xC);

				for (int i = 0; i < count; ++i)
				{
					IntPtr slot = entries + 0x10 * i;
					var id = new DeepPointer(slot + 0x18, 0xC).DerefString(game, 128);

					dynamic value = null;
					if (tag == "bools") value = game.ReadValue<bool>(slot + 0x1C);
					if (tag == "ints") value = game.ReadValue<int>(slot + 0x1C);
					if (tag == "floats") value = game.ReadValue<float>(slot + 0x1C);
					if (tag == "strings") value = rs(rp(slot + 0x1C) + 0xC, 128);

					if (!old.Tags[tag].ContainsKey(id) || old.Tags[tag][id] != value)
					{
						current.Tags[tag][id] = value;
						changedTags.Add(id + ":" + value);
					}
				}
			}

			return changedTags;
		});

		return true;
	});

	current.Tags = new Dictionary<string, dynamic>
	{
		{ "bools", new Dictionary<string, bool>() },
		{ "ints", new Dictionary<string, int>() },
		{ "floats", new Dictionary<string, float>() },
		{ "strings", new Dictionary<string, string>() }
	};

	vars.Unity.Load(game, 5000);
}

update
{
	if (!vars.Unity.Loaded) return false;

	vars.Player.UpdateAll(game);
}

start
{
	return vars.Player["igt"].Old == 0.000f && vars.Player["igt"].Current > 0.000f;
}

split
{
	if (vars.Player["startPos"].Changed)
	{
		foreach (var loc in vars.SnQLocations)
			if (vars.Player["startPos"].Current.Distance(loc.Value) < 10.0f)
				return settings[loc.Key];
	}

	foreach (var tag in vars.UpdateTags())
	{
		vars.Log("Got tag " + tag + ".");
		if (settings.ContainsKey(tag) && settings[tag])
			return true;
	}
}

reset
{
	return vars.Player["startPos"].Changed && vars.Player["startPos"].Current.Distance(new Vector3f(657.4f, 21.0f, 354.1f)) < 10.0f;
}

gameTime
{
	if (vars.Player["igt"].Current > 0.000f)
		return TimeSpan.FromSeconds(vars.Player["igt"].Current);
}

isLoading
{
	return true;
}

exit
{
	vars.Unity.Reset();
}

shutdown
{
	vars.Unity.Reset();
}
