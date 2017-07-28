/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#include "SAdvAIRCallback.h"

void sendToAIR1 (FREContext context, NSString *package) {
    
    if (context != NULL) {
        const uint8_t* packageUTF8 = (const uint8_t*) [package UTF8String];
        const uint8_t* trailerUTF = (const uint8_t*) "";
        FREDispatchStatusEventAsync(context, packageUTF8, trailerUTF);
    }
}

void sendCPICallback (FREContext context, NSString *name, BOOL success, NSString *callack) {
    
    NSString *package = [NSString stringWithFormat:@"{\"name\":\"%@\", \"success\": %d, \"callback\": \"%@\"}", name, success, callack];
    sendToAIR1(context, package);
    
}
