#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_bodycam {
    class bodycam {
        file = MODULES_DIRECTORY\grad-bodycam\functions;

        class createOverlay {};
        class onPrevNextButton {};
        class setHost {};
        class startBodyCam {};
        class stopBodyCam {};
        class updateOverlay {};
    };
};
