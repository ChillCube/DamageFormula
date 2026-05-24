extends DamageFormula
class_name FlatReductionFormula

## Defense directly subtracts from incoming damage (minimum 1).
## Used in: classic D&D, Fire Emblem, many turn-based RPGs.
func calculate(raw_damage: float, stats: Stats) -> float:
	_require_stats(stats, ["Defense"])
	return max(1.0, raw_damage - stats.stats["Defense"])
