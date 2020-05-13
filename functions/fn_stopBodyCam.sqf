#include "script_component.hpp"

private _display = uiNamespace getVariable [QGVAR(bodycamOverlayDisplay),displayNull];
if (!isNull _display) then {
    _display closeDisplay 2;
};

player switchCamera "INTERNAL";

diwako_dui_main_toggled_off = GVAR(diwako_dui_previousState);

// cleanup
{
    missionNamespace setVariable [_x,nil];
} forEach [
    QGVAR(diwako_dui_previousState),
    QGVAR(currentHost),
    QGVAR(selectableUnits)
];
