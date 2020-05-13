#include "script_component.hpp"

params [["_newHost",objNull]];

/* // remove EHs from previous host
if (!isNull (missionNamespace getVariable [QGVAR(currentHost),objNull])) then {
    GVAR(currentHost) removeEventHandler ["GetInMan",GVAR(hostGetInManEH)];
    GVAR(currentHost) removeEventHandler ["GetOutMan",GVAR(hostGetOutManEH)]
};

GVAR(hostGetInManEH) = _newHost addEventHandler ["GetInMan",{
    params ["_unit"];
    _unit switchCamera "INTERNAL";
}];

GVAR(hostGetOutManEH) = _newHost addEventHandler ["GetOutMan",{
    params ["_unit"];
    GVAR(bodycamCam) cameraEffect ["INTERNAL","BACK"];
}]; */


_newHost switchCamera "INTERNAL";

GVAR(currentHost) = _newHost;
