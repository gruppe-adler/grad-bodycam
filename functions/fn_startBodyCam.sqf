#include "script_component.hpp"

params [["_units",[objNull]]];

private _newHost = _units param [0,objNull];

GVAR(selectableUnits) = _units;

closeDialog 0;
GVAR(diwako_dui_previousState) = diwako_dui_main_toggled_off;
diwako_dui_main_toggled_off = true;
showCinemaBorder false;

GVAR(bodycamTarget) = "Sign_Sphere10cm_F" createVehicleLocal getPos player;
hideObject GVAR(bodycamTarget);

GVAR(bodycamCam) = "camera" camCreate getPosATL _newHost;
GVAR(bodycamCam) camPrepareFov 0.700;
GVAR(bodycamCam) camCommitPrepared 0;

[_newHost] call FUNC(setHost);
[] call FUNC(createOverlay);
