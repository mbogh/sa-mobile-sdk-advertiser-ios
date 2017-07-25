/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>
#import "SAdvUnityCallback.h"

#if defined(__has_include)
#if __has_include("SuperAwesomeAdvertiserSDKUnity.h")
    #import "SuperAwesomeAdvertiserSDKUnity.h"
#else
    #import "SuperAwesomeAdvertiser.h"
#endif
#endif

extern "C" {
    
    /**
     * Unity to native iOS method that sends a CPI event.
     */
    void SuperAwesomeAdvertiserUnitySACPIHandleInstall () {
         
        [[SuperAwesomeAdvertiser getInstance] handleInstall:^(BOOL success) {
            sendCPICallback(@"SuperAwesomeAdvertiser", success, @"HandleInstall");
        }];
    }
}
