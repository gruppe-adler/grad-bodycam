#include "script_component.hpp"

_display = (findDisplay 46) createDisplay "RscDisplayEmpty";
uiNamespace setVariable [QGVAR(bodycamOverlayDisplay),_display];

_display displayAddEventHandler ["unload",{_this call FUNC(stopBodyCam)}];

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
