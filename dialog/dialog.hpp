class grad_bodycam_rscOverlay {
    idd = GRAD_BODYCAM_IDD_OVERLAY;
    movingEnable = false;
    enableSimulation = true;

    onUnload = "_this call grad_bodycam_fnc_stopBodyCam";

    class ControlsBackground {
        class vignette: grad_bodycam_rscVignette {};
        class interlacing1: grad_bodycam_rscInterlacing {
            idc = GRAD_BODYCAM_IDC_INTERLACE1;
        };
        class interlacing2: grad_bodycam_rscInterlacing {
            idc = GRAD_BODYCAM_IDC_INTERLACE2;
        };
        class static: grad_bodycam_rscStatic {
            idc = GRAD_BODYCAM_IDC_STATIC;
        };

        class tablet: grad_bodycam_rscPicture {
            x = "safeZoneX";
            y = "safeZoneY";
            w = "safeZoneW";
            h = "safeZoneH";

            text = QUOTE(MODULES_DIRECTORY\grad-bodycam\data\tablet4.paa);
        };
    };
    class Controls {
        class exitButton: grad_bodycam_rscButton {
            x = BUTTON_X;
            y = BUTTON_Y(0.51);
            w = BUTTON_W;
            h = BUTTON_H;
            toolTip = "EXIT";
            action = "[] call grad_bodycam_fnc_stopBodyCam";
        };
        class nextButton: exitButton {
            y = BUTTON_Y(0.59);
            toolTip = "NEXT";
            action = "[1] call grad_bodycam_fnc_onPrevNextButton";
        };
        class prevButton: exitButton {
            y = BUTTON_Y(0.65);
            toolTip = "PREVIOUS";
            action = "[-1] call grad_bodycam_fnc_onPrevNextButton";
        };
        class unusedButton1: exitButton {
            y = BUTTON_Y(0.71);
            toolTip = "no function";
            action = "";
        };
        class unusedButton2: exitButton {
            y = BUTTON_Y(0.77);
            toolTip = "no function";
            action = "";
        };
        class unusedButton3: exitButton {
            y = BUTTON_Y(0.83);
            toolTip = "no function";
            action = "";
        };
    };
};
