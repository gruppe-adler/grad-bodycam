#include "script_component.hpp"

GVAR(bodycamCam) cameraEffect ["terminate","back"];
camDestroy GVAR(bodycamCam);

private _display = uiNamespace getVariable [QGVAR(bodycamOverlayDisplay),displayNull];
if (!isNull _display) then {
    _display closeDisplay 2;
};

deleteVehicle GVAR(bodycamTarget);

diwako_dui_main_toggled_off = GVAR(diwako_dui_previousState);

player switchCamera "INTERNAL";

// cleanup
{
    missionNamespace setVariable [_x,nil];
} forEach [
    QGVAR(bodycamCam),
    QGVAR(diwako_dui_previousState),
    QGVAR(bodycamTarget),
    QGVAR(currentHost),
    QGVAR(selectableUnits)
];
