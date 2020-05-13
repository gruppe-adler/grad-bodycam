#include "script_component.hpp"
#define INTERLACING_ROUND_TIME      90
#define INTERLACE_ALPHA             0.3
#define VIGNETTE_ALPHA              0.4
#define STATIC_ALPHA                0.8
#define STATIC_HANGTIME             0.05
#define STATIC_MAXWAIT              60
#define STATIC_CONTINUATIONCHANCE   92


_display = (findDisplay 46) createDisplay "RscDisplayEmpty";
uiNamespace setVariable [QGVAR(bodycamOverlayDisplay),_display];

_display displayAddEventHandler ["unload",{_this call FUNC(stopBodyCam)}];

private _ctrlVignette = _display ctrlCreate ["RscVignette",-1];
_ctrlVignette ctrlSetTextColor [0, 0, 0, VIGNETTE_ALPHA];
_ctrlVignette ctrlSetText "a3\ui_f\data\gui\rsccommon\rscvignette\vignette_gs.paa";

// INTERLACING =================================================================
private _ctrlInterlacing1 = _display ctrlCreate ["RscVignette",-1];
_ctrlInterlacing1 ctrlSetTextColor [1, 1, 1, INTERLACE_ALPHA];
_ctrlInterlacing1 ctrlSetText "a3\ui_f\data\igui\rsctitles\interlacing\interlacing_ca.paa";

private _ctrlInterlacing2 = _display ctrlCreate ["RscVignette",-1];
_ctrlInterlacing2 ctrlSetTextColor [1, 1, 1, INTERLACE_ALPHA];
_ctrlInterlacing2 ctrlSetText "a3\ui_f\data\igui\rsctitles\interlacing\interlacing_ca.paa";

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

// STATIC ======================================================================
private _ctrlStatic = _display ctrlCreate ["RscVignette",-1];
_ctrlStatic ctrlSetTextColor [1,1,1,STATIC_ALPHA];
_ctrlStatic ctrlSetText "";

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

// BUTTONS =====================================================================
private _ctrlButtonClose = _display ctrlCreate ["RscButton",-1];
_ctrlButtonClose ctrlSetText "EXIT";
_ctrlButtonClose ctrlAddEventHandler ["buttonClick",{_this call FUNC(stopBodyCam)}];

private _ctrlButtonPrev = _display ctrlCreate ["RscButton",-1];
_ctrlButtonPrev ctrlSetText "<";
_ctrlButtonPrev ctrlAddEventHandler ["buttonClick",{[-1] call FUNC(onPrevNextButton)}];
_ctrlButtonPrev ctrlSetPosition [safezoneX + 0.25*safezoneW, safezoneY + 0.75*safezoneH];
_ctrlButtonPrev ctrlCommit 0;
uiNamespace setVariable [QGVAR(bodycamOverlayButtonPrev),_ctrlButtonPrev];

private _ctrlButtonNext = _display ctrlCreate ["RscButton",-1];
_ctrlButtonNext ctrlSetText ">";
_ctrlButtonNext ctrlAddEventHandler ["buttonClick",{[1] call FUNC(onPrevNextButton)}];
_ctrlButtonNext ctrlSetPosition [safezoneX + 0.75*safezoneW, safezoneY + 0.75*safezoneH];
_ctrlButtonNext ctrlCommit 0;
uiNamespace setVariable [QGVAR(bodycamOverlayButtonNext),_ctrlButtonNext];

[] call FUNC(updateOverlay);
