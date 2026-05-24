extends DamageFormula
class_name SpeedEvasionFormula

## Speed gives a chance to halve the incoming hit before Defense applies. Capped at 75%.
## Dodge chance = Speed / (Speed + 100).
## Used in: action RPGs and fighting games where agility means partial evasion.
func calculate(raw_damage: float, stats: Stats) -> float:
	_require_stats(stats, ["Defense", "Speed"])
	var evade_chance: float = clamp(stats.stats["Speed"] / (stats.stats["Speed"] + 100.0), 0.0, 0.75)
	var effective: float = raw_damage * 0.5 if randf() < evade_chance else raw_damage
	return max(1.0, effective - stats.stats["Defense"])
