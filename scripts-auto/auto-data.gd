extends Node

# --- Upgrade Tables ---

# 1️⃣ Inflation Rate — increases base balloon value multiplier
const InflationRate_value = {
	0: 0.5,
	1: 1,
	2: 2,
	3: 4,
	4: 6,
	5: 5,
	6: 6,
	7: 7,
	8: 8,
	9: 9,
	10: 10,
}

# 2️⃣ Air Rush — reduces balloon spawn interval
const AirRush_value = {
	0: 1.3,
	1: 1.0,
	2: 0.95,
	3: 0.90,
	4: 0.85,
	5: 0.80,
	6: 0.75,
	7: 0.70,
	8: 0.65,
	9: 0.60,
	10: 0.55,
}

# 3️⃣ Sky Overload — increases max balloon limit in scene
const SkyOverload_limit = {
	0: 20,
	1: 20,
	2: 25,
	3: 30,
	4: 35,
	5: 40,
	6: 45,
	7: 50,
	8: 60,
	9: 70,
	10: 80,
}

# 4️⃣ Combo Pressure — increases combo multiplier
const ComboPressure = {
	0: {"limit" : 10},
	1: {"limit" : 20},
	2: {"limit" : 30},
	3: {"limit" : 40},
	4: {"limit" : 50},
	5: {"limit" : 60},
	6: {"limit" : 70},
	7: {"limit" : 80},
	8: {"limit" : 90},
	9: {"limit" : 100},
	10:{"limit" : 130},
}

# 5️⃣ Elite Balloons — your existing data (with level 0 added)
const EliteBalloons = {
	"chance": {
		0: { "regular": 1.0, "copper": 0.0, "silver": 0.0, "gold": 0.0, "diamond": 0.0, "prism": 0.0 },
		1: { "regular": 0.85, "copper": 0.10, "silver": 0.04, "gold": 0.01, "diamond": 0.00, "prism": 0.00 },
		2: { "regular": 0.80, "copper": 0.12, "silver": 0.05, "gold": 0.02, "diamond": 0.01, "prism": 0.00 },
		3: { "regular": 0.75, "copper": 0.13, "silver": 0.07, "gold": 0.03, "diamond": 0.01, "prism": 0.01 },
		4: { "regular": 0.70, "copper": 0.14, "silver": 0.09, "gold": 0.04, "diamond": 0.02, "prism": 0.01 },
		5: { "regular": 0.65, "copper": 0.15, "silver": 0.11, "gold": 0.05, "diamond": 0.02, "prism": 0.02 },
		6: { "regular": 0.60, "copper": 0.16, "silver": 0.13, "gold": 0.06, "diamond": 0.03, "prism": 0.02 },
		7: { "regular": 0.55, "copper": 0.17, "silver": 0.14, "gold": 0.07, "diamond": 0.04, "prism": 0.03 },
		8: { "regular": 0.50, "copper": 0.18, "silver": 0.15, "gold": 0.08, "diamond": 0.05, "prism": 0.04 },
		9: { "regular": 0.45, "copper": 0.18, "silver": 0.16, "gold": 0.09, "diamond": 0.06, "prism": 0.06 },
		10:{ "regular": 0.40, "copper": 0.19, "silver": 0.16, "gold": 0.10, "diamond": 0.07, "prism": 0.08 }
	},
	
	"mult": {
		"regular": 1,
		"copper": 2,
		"silver": 5,
		"gold": 10,
		"diamond": 25,
		"prism": 100
	}
}


# 6️⃣ Chain Reaction — chance that explosion spawns a sting
const ChainReaction_chance = {
	0: 0.0,
	1: 0.05,
	2: 0.07,
	3: 0.10,
	4: 0.13,
	5: 0.16,
	6: 0.20,
	7: 0.25,
	8: 0.30,
	9: 0.35,
	10: 0.40,
}

# 7️⃣ Phantom Pop — chance balloon doesn't explode but gives reward
const PhantomPop = {
	0: { "chance": 0.0,  "limit": 0 },
	1: { "chance": 0.05, "limit": 1 },
	2: { "chance": 0.07, "limit": 1 },
	3: { "chance": 0.10, "limit": 1 },
	4: { "chance": 0.13, "limit": 2 },
	5: { "chance": 0.16, "limit": 2 },
	6: { "chance": 0.20, "limit": 2 },
	7: { "chance": 0.25, "limit": 3 },
	8: { "chance": 0.30, "limit": 3 },
	9: { "chance": 0.35, "limit": 3 },
	10:{ "chance": 0.40, "limit": 4 },
}

# 8️⃣ Auto Detonate — chance for self-explosion after delay
const AutoDetonate_chance = {
	0: 0.0,
	1: 0.02,
	2: 0.03,
	3: 0.04,
	4: 0.05,
	5: 0.06,
	6: 0.08,
	7: 0.10,
	8: 0.12,
	9: 0.14,
	10: 0.16,
}
