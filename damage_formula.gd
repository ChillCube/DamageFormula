extends Resource
class_name DamageFormula

## Override calculate() in subclasses.
## raw_damage: incoming damage before mitigation
## stats: the defender's full Stats resource (Stats / StatsAndHealth / LevelUpResource)
## Returns the effective damage to subtract from HP.
func calculate(raw_damage: float, stats: Stats) -> float:
	return raw_damage

## Call this at the top of calculate() with the stat keys you need.
## Pushes an error and asserts in debug if any key is missing from stats.stats.
func _require_stats(stats: Stats, required: Array) -> void:
	for key in required:
		if not stats.stats.has(key):
			push_error(
				"%s requires stat '%s' but it is missing. Available keys: %s"
				% [get_class(), key, stats.stats.keys()]
			)
			assert(false)
