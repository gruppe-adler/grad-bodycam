class grad_bodycam_rscPicture {
    type = CT_STATIC;
    style = ST_PICTURE;
    idc = -1;

    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;

    access = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    fixedWidth = 0;
    font = "TahomaB";
    lineSpacing = 0;
    shadow = 0;
    sizeEx = 0;
    text = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
};

class grad_bodycam_rscVignette: grad_bodycam_rscPicture {
    x = "safezoneXAbs";
    y = "safezoneY";
    w = "safezoneWAbs";
    h = "safezoneH";

    colortext[] = {0,0,0,0.4};
    text = "a3\ui_f\data\gui\rsccommon\rscvignette\vignette_gs.paa";
};

class grad_bodycam_rscInterlacing: grad_bodycam_rscVignette {
    colortext[] = {1,1,1,0.4};
    text = "a3\ui_f\data\igui\rsctitles\interlacing\interlacing_ca.paa";
};

class grad_bodycam_rscStatic: grad_bodycam_rscVignette {
    colortext[] = {1,1,1,0.8};
    text = "";
};

class grad_bodycam_rscButton {
    type = CT_BUTTON;
    style = ST_CENTER;
    idc = -1;

    access = 0;
    borderSize = 0;
    colorBackground[] = {0,0,0,0};
    colorBackgroundActive[] = {0,0,0,0};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBorder[] = {0,0,0,0};
    colorDisabled[] = {0,0,0,0};
    colorFocused[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0};
    colorText[] = {1,1,1,0};
    deletable = 0;
    fade = 0;
    font = "RobotoCondensed";
    h = 0.039216;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 0;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    text = "";
    url = "";
    w = 0.095589;
    x = 0;
    y = 0;
};
