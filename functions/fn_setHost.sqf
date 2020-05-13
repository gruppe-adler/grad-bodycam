#include "script_component.hpp"

#define TARGETOFFSET        [2,8,1]
#define CAMOFFSET           [0.18,-0.2,0.12]
#define HOSTMEMPOINT        "Head"

params [["_newHost",objNull]];

// remove EHs from previous host
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
}];


GVAR(bodycamTarget) attachTo [_newHost,TARGETOFFSET];
GVAR(bodycamCam) attachTo [_newHost,CAMOFFSET,HOSTMEMPOINT];

GVAR(bodycamCam) camPrepareTarget _target;
GVAR(bodycamCam) camCommitPrepared 0;

private _objectParent = objectParent _newHost;
if (isNull _objectParent) then {
    GVAR(bodycamCam) cameraEffect ["INTERNAL","BACK"];
} else {
    _newHost switchCamera "INTERNAL";
};

GVAR(currentHost) = _newHost;
