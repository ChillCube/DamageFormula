extends DamageFormula
class_name LuckMitigationFormula

## Luck partially reduces damage instead of fully dodging it.
## Applied on top of Defense percent reduction: Luck=100 gives an extra 50% reduction.
## Used in: JRPGs where Luck softens hits rather than negating them entirely.
func calculate(raw_damage: float, stats: Stats) -> float:
	_require_stats(stats, ["Defense", "Luck"])
	var after_defense: float = raw_damage * (100.0 / (100.0 + max(0.0, stats.stats["Defense"])))
	var luck: float = max(0.0, stats.stats["Luck"])
	var luck_reduction: float = luck / (luck + 100.0)
	return max(1.0, after_defense * (1.0 - luck_reduction))
