extends DamageFormula
class_name PercentReductionFormula

## Defense reduces damage by a percentage: damage * 100 / (100 + defense).
## At defense=100 you take 50%; at defense=300 you take 25%. Asymptotic — never reaches 0.
## Used in: World of Warcraft, League of Legends, many MMOs.
func calculate(raw_damage: float, stats: Stats) -> float:
	_require_stats(stats, ["Defense"])
	return raw_damage * (100.0 / (100.0 + max(0.0, stats.stats["Defense"])))
