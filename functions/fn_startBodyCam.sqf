#include "script_component.hpp"

params [["_units",[objNull]]];

private _newHost = _units param [0,objNull];

GVAR(selectableUnits) = _units;

// TODO
closeDialog 0;
// \TODO

GVAR(diwako_dui_previousState) = diwako_dui_main_toggled_off;
diwako_dui_main_toggled_off = true;

[_newHost] call FUNC(setHost);
[] call FUNC(createOverlay);
