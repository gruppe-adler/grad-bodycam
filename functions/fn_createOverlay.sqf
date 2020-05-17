#include "script_component.hpp"
#include "..\dialog\defines.hpp"

#define INTERLACING_ROUND_TIME      90

#define STATIC_HANGTIME             0.05
#define STATIC_MAXWAIT              60
#define STATIC_CONTINUATIONCHANCE   92


_display = (findDisplay 46) createDisplay "grad_bodycam_rscOverlay";
uiNamespace setVariable [QGVAR(bodycamOverlayDisplay),_display];

private _ctrlInterlacing1 = _display displayCtrl GRAD_BODYCAM_IDC_INTERLACE1;
private _ctrlInterlacing2 = _display displayCtrl GRAD_BODYCAM_IDC_INTERLACE2;

private _fnc_animateInterlacing = {
    params [["_ctrlInterlacing1",controlNull],["_ctrlInterlacing2",controlNull],"_fnc_animateInterlacing"];

    if (isNull _ctrlInterlacing1 || isNull _ctrlInterlacing2) exitWith {};

    // reset to start positions
    _ctrlInterlacing1 ctrlSetPosition [safeZoneXAbs,safeZoneY];
    _ctrlInterlacing1 ctrlCommit 0;
    _ctrlInterlacing2 ctrlSetPosition [safeZoneXAbs,safeZoneY - safeZoneH];
    _ctrlInterlacing2 ctrlCommit 0;

    // scroll down
    _ctrlInterlacing1 ctrlSetPosition [safeZoneXAbs,safeZoneY + safeZoneH];
    _ctrlInterlacing1 ctrlCommit INTERLACING_ROUND_TIME;
    _ctrlInterlacing2 ctrlSetPosition [safeZoneXAbs,safeZoneY];
    _ctrlInterlacing2 ctrlCommit INTERLACING_ROUND_TIME;

    private _waitCondition = {
        params [["_ctrlInterlacing1",controlNull],["_ctrlInterlacing2",controlNull]];

        (ctrlCommitted _ctrlInterlacing1 && ctrlCommitted _ctrlInterlacing2) ||
        isNull _ctrlInterlacing1 ||
        isNull _ctrlInterlacing2
    };
    [_waitCondition,_fnc_animateInterlacing,[_ctrlInterlacing1,_ctrlInterlacing2,_fnc_animateInterlacing],INTERLACING_ROUND_TIME + 10,{}] call CBA_fnc_waitUntilAndExecute;
};
[_ctrlInterlacing1,_ctrlInterlacing2,_fnc_animateInterlacing] call _fnc_animateInterlacing;


private _ctrlStatic = _display displayCtrl GRAD_BODYCAM_IDC_STATIC;
private _fnc_animateStatic = {
    params [["_ctrlStatic",controlNull],"_fnc_animateStatic"];

    if (isNull _ctrlStatic) exitWith {};

    _ctrlStatic ctrlSetText format ["a3\ui_f\data\igui\rsctitles\static\feedstatic_%1_ca.paa",selectRandom ["00","01","02","03","04","05","06","07","08","09","10","11","12"]];
    [{
        params [["_ctrlStatic",controlNull],"_fnc_animateStatic"];

        if (isNull _ctrlStatic) exitWith {};

        _ctrlStatic ctrlSetText "";
        _timeUntilNext = if (random 100 < STATIC_CONTINUATIONCHANCE) then {0} else {random STATIC_MAXWAIT};

        [_fnc_animateStatic,[_ctrlStatic,_fnc_animateStatic],_timeUntilNext] call CBA_fnc_waitAndExecute;

    },[_ctrlStatic,_fnc_animateStatic],STATIC_HANGTIME] call CBA_fnc_waitAndExecute;
};
[_ctrlStatic,_fnc_animateStatic] call _fnc_animateStatic;

[] call FUNC(updateOverlay);
