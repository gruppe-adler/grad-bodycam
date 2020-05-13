#include "script_component.hpp"

private _display = uiNamespace getVariable [QGVAR(bodycamOverlayDisplay),displayNull];
private _ctrlButtonNext = uiNamespace getVariable [QGVAR(bodycamOverlayButtonNext),controlNull];
private _ctrlButtonPrev = uiNamespace getVariable [QGVAR(bodycamOverlayButtonPrev),controlNull];

private _switchButtonsEnabled = count units group GVAR(currentHost) > 1;
_ctrlButtonNext ctrlEnable _switchButtonsEnabled;
_ctrlButtonPrev ctrlEnable _switchButtonsEnabled;
