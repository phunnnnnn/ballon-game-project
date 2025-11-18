extends Node

# --- Upgrade Tables ---

# 1️⃣ Inflation Rate — increases base balloon value multiplier
const InflationRate = {
	0: {"value": 0.5, "price": 0},
	1: {"value": 1,   "price": 20},
	2: {"value": 2,   "price": 40},
	3: {"value": 4,   "price": 80},
	4: {"value": 6,   "price": 120},
	5: {"value": 5,   "price": 200},
	6: {"value": 6,   "price": 300},
	7: {"value": 7,   "price": 450},
	8: {"value": 8,   "price": 600},
	9: {"value": 9,   "price": 900},
	10: {"value": 10, "price": 1200},
}


# 2️⃣ Air Rush — reduces balloon spawn interval
const AirRush = {
	0: {"interval": 1.3, "price": 0},
	1: {"interval": 1.0, "price": 30},
	2: {"interval": 0.95, "price": 60},
	3: {"interval": 0.90, "price": 100},
	4: {"interval": 0.85, "price": 150},
	5: {"interval": 0.80, "price": 220},
	6: {"interval": 0.75, "price": 300},
	7: {"interval": 0.70, "price": 420},
	8: {"interval": 0.65, "price": 600},
	9: {"interval": 0.60, "price": 850},
	10: {"interval": 0.55, "price": 1100},
}

# 3️⃣ Sky Overload — increases max balloon limit in scene
const SkyOverload = {
	0: {"limit": 20, "price": 0},
	1: {"limit": 20, "price": 40},
	2: {"limit": 25, "price": 80},
	3: {"limit": 30, "price": 130},
	4: {"limit": 35, "price": 180},
	5: {"limit": 40, "price": 260},
	6: {"limit": 45, "price": 350},
	7: {"limit": 50, "price": 500},
	8: {"limit": 60, "price": 700},
	9: {"limit": 70, "price": 900},
	10: {"limit": 80, "price": 1200},
}

# 4️⃣ Combo Pressure — increases combo multiplier
const ComboPressure = {
	0: {"limit": 10,  "price": 0},
	1: {"limit": 20,  "price": 20},
	2: {"limit": 30,  "price": 50},
	3: {"limit": 40,  "price": 90},
	4: {"limit": 50,  "price": 130},
	5: {"limit": 60,  "price": 180},
	6: {"limit": 70,  "price": 260},
	7: {"limit": 80,  "price": 350},
	8: {"limit": 90,  "price": 480},
	9: {"limit": 100, "price": 650},
	10: {"limit": 130, "price": 900},
}

# 5️⃣ Elite Balloons — your existing data (with level 0 added)
const EliteBalloons = {
	0: {
		"price": 0,
		"chance": {
			"regular": 1.0,
			"copper": 0.0,
			"silver": 0.0,
			"gold": 0.0,
			"diamond": 0.0,
			"prism": 0.0,
		}
	},

	1: {
		"price": 40,
		"chance": {
			"regular": 0.85,
			"copper": 0.10,
			"silver": 0.04,
			"gold": 0.01,
			"diamond": 0.00,
			"prism": 0.00,
		}
	},

	2: {
		"price": 80,
		"chance": {
			"regular": 0.80,
			"copper": 0.12,
			"silver": 0.05,
			"gold": 0.02,
			"diamond": 0.01,
			"prism": 0.00,
		}
	},

	3: {
		"price": 120,
		"chance": {
			"regular": 0.75,
			"copper": 0.13,
			"silver": 0.07,
			"gold": 0.03,
			"diamond": 0.01,
			"prism": 0.01,
		}
	},

	4: {
		"price": 200,
		"chance": {
			"regular": 0.70,
			"copper": 0.14,
			"silver": 0.09,
			"gold": 0.04,
			"diamond": 0.02,
			"prism": 0.01,
		}
	},

	5: {
		"price": 300,
		"chance": {
			"regular": 0.65,
			"copper": 0.15,
			"silver": 0.11,
			"gold": 0.05,
			"diamond": 0.02,
			"prism": 0.02,
		}
	},

	6: {
		"price": 450,
		"chance": {
			"regular": 0.60,
			"copper": 0.16,
			"silver": 0.13,
			"gold": 0.06,
			"diamond": 0.03,
			"prism": 0.02,
		}
	},

	7: {
		"price": 650,
		"chance": {
			"regular": 0.55,
			"copper": 0.17,
			"silver": 0.14,
			"gold": 0.07,
			"diamond": 0.04,
			"prism": 0.03,
		}
	},

	8: {
		"price": 900,
		"chance": {
			"regular": 0.50,
			"copper": 0.18,
			"silver": 0.15,
			"gold": 0.08,
			"diamond": 0.05,
			"prism": 0.04,
		}
	},

	9: {
		"price": 1200,
		"chance": {
			"regular": 0.45,
			"copper": 0.18,
			"silver": 0.16,
			"gold": 0.09,
			"diamond": 0.06,
			"prism": 0.06,
		}
	},

	10: {
		"price": 1600,
		"chance": {
			"regular": 0.40,
			"copper": 0.19,
			"silver": 0.16,
			"gold": 0.10,
			"diamond": 0.07,
			"prism": 0.08,
		}
	}
}

const EliteBalloons_mult = {
		"regular": 1,
		"copper": 2,
		"silver": 5,
		"gold": 10,
		"diamond": 25,
		"prism": 100
	}

# 6️⃣ Chain Reaction — chance that explosion spawns a sting
const ChainReaction = {
	0: {"chance": 0.0, "price": 0},
	1: {"chance": 0.05, "price": 20},
	2: {"chance": 0.07, "price": 50},
	3: {"chance": 0.10, "price": 80},
	4: {"chance": 0.13, "price": 120},
	5: {"chance": 0.16, "price": 180},
	6: {"chance": 0.20, "price": 260},
	7: {"chance": 0.25, "price": 350},
	8: {"chance": 0.30, "price": 480},
	9: {"chance": 0.35, "price": 650},
	10: {"chance": 1.0, "price": 900},
}


# 7️⃣ Phantom Pop — chance balloon doesn't explode but gives reward
const PhantomPop = {
	0: {"chance": 0.0,  "limit": 0, "price": 0},
	1: {"chance": 0.05, "limit": 1, "price": 25},
	2: {"chance": 0.07, "limit": 1, "price": 60},
	3: {"chance": 0.10, "limit": 1, "price": 100},
	4: {"chance": 0.13, "limit": 2, "price": 150},
	5: {"chance": 0.16, "limit": 2, "price": 220},
	6: {"chance": 0.20, "limit": 2, "price": 300},
	7: {"chance": 0.25, "limit": 3, "price": 450},
	8: {"chance": 0.30, "limit": 3, "price": 650},
	9: {"chance": 0.35, "limit": 3, "price": 900},
	10:{"chance": 0.40, "limit": 4, "price": 1200},
}


# 8️⃣ Auto Detonate — chance for self-explosion after delay
const AutoDetonate = {
	0: {"chance": 0.0, "price": 0},
	1: {"chance": 0.02, "price": 15},
	2: {"chance": 0.03, "price": 40},
	3: {"chance": 0.04, "price": 70},
	4: {"chance": 0.05, "price": 100},
	5: {"chance": 0.06, "price": 150},
	6: {"chance": 0.08, "price": 220},
	7: {"chance": 0.10, "price": 300},
	8: {"chance": 0.12, "price": 450},
	9: {"chance": 0.14, "price": 650},
	10:{"chance": 0.16, "price": 900},
}
