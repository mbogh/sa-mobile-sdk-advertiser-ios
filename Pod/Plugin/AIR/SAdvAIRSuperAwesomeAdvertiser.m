/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import "SAdvAIRCallback.h"

#if defined(__has_include)
#if __has_include(<SuperAwesomeAdvertiserSDK/SuperAwesomeAdvertiserSDK.h>)
    #import <SuperAwesomeAdvertiserSDK/SuperAwesomeAdvertiserSDK.h>
#else
    #import "SuperAwesomeAdvertiser.h"
#endif
#endif

FREObject SuperAwesomeAdvertiserAIRSACPIHandleInstall (FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    [[SuperAwesomeAdvertiser getInstance] handleInstall:^(BOOL success) {
        sendCPICallback(ctx, @"SuperAwesomeAdvertiser", success, @"HandleInstall");
    }];
    
    return NULL;
}
