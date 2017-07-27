/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import "SAdvAIRCallback.h"
#import "SAdvAIRVerifyInstall.h"

#if defined(__has_include)
#if __has_include(<SuperAwesomeAdvertiserSDK/SAVerifyInstall.h>)
    #import <SuperAwesomeAdvertiserSDK/SAVerifyInstall.h>
#else
    #import "SAVerifyInstall.h"
#endif
#endif

FREObject SuperAwesomeAdvertiserAIRSAVerifyInstall (FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    [[SAVerifyInstall getInstance] handleInstall:^(BOOL success) {
        sendCPICallback(ctx, @"SAVerifyInstall", success, @"HandleInstall");
    }];
    
    return NULL;
}
