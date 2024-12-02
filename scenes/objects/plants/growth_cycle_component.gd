class_name GrowthCycleComponent
extends Node

signal crop_maturity
signal crop_harvesting

@export var current_growth_state: DataTypes.GrowthStates = DataTypes.GrowthStates.Germination
@export_range(1, 365) var days_until_harvest: int = 7

var is_watered: bool
var starting_day: int
var current_day: int


func _ready() -> void:
    DayNightCycleManager.time_tick_day.connect(on_time_tick_day)


func on_time_tick_day(day: int) -> void:
    current_day = day

    if is_watered:
        if starting_day == 0:
            starting_day = day

        growth_states()
        harvest_state()


func growth_states() -> void:
    if current_growth_state == DataTypes.GrowthStates.Maturity:
        return

    const num_states = 5
    var growth_days_passed = (current_day - starting_day)
    var state_index = growth_days_passed % num_states + 1
    current_growth_state = state_index as DataTypes.GrowthStates

    #var state_name = DataTypes.GrowthStates.keys()[current_growth_state]
    #print('Current growth state: ', state_name)

    if current_growth_state == DataTypes.GrowthStates.Maturity:
        crop_maturity.emit()


func harvest_state() -> void:
    if current_growth_state == DataTypes.GrowthStates.Harvesting:
        return

    var days_passed = (current_day - starting_day) % days_until_harvest
    if days_passed == days_until_harvest - 1:
        current_growth_state = DataTypes.GrowthStates.Harvesting
        crop_harvesting.emit()


func get_current_growth_state() -> DataTypes.GrowthStates:
    return current_growth_state
