extends DamageFormula
class_name LuckDodgeFormula

## Luck gives a flat % chance to completely avoid the hit (take 0 damage).
## On a failed dodge, Defense reduces damage normally (flat reduction, min 1).
## Luck is treated as a 0–100 value: Luck=25 means 25% dodge chance.
## Used in: Final Fantasy series, Pokemon (evasion), many JRPGs.
func calculate(raw_damage: float, stats: Stats) -> float:
	_require_stats(stats, ["Defense", "Luck"])
	var dodge_chance: float = clamp(stats.stats["Luck"] / 100.0, 0.0, 1.0)
	if randf() < dodge_chance:
		return 0.0
	return max(1.0, raw_damage - stats.stats["Defense"])
