/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>

#if defined(__has_include)
#if __has_include(<SuperAwesomeSDK/NSDictionary+SAJson.h>)
#import <SuperAwesomeSDK/NSDictionary+SAJson.h>
#else
#import "NSDictionary+SAJson.h"
#endif
#endif

// forward declaration of this method - which is part of the Unity C
// libray, so it would be available there
void UnitySendMessage(const char *identifier, const char *function, const char *payload);

/**
 * Generic method used to send messages back to unity
 *
 * @param unityName the name of the unity ad to send the message back to
 * @param data      a dictionary of data to send back
 */
static inline void sendToUnity1 (NSString *unityName, NSDictionary *data) {
    
    const char *name = [unityName UTF8String];
    NSString *payload = [data jsonCompactStringRepresentation];
    const char *payloadUTF8 = [payload UTF8String];
    UnitySendMessage (name, "nativeCallback", payloadUTF8);
    
}

/**
 * Method that sends back CPU data to Unity
 *
 * @param unityName     the name of the unity ad to send the message back to
 * @param success        whether the /install event was sent OK
 * @param callback      callback method
 */
static inline void sendCPICallback (NSString *unityName, BOOL success, NSString *callback) {
    
    NSDictionary *data = @{
                           @"success": [NSString stringWithFormat:@"%d", success],
                           @"type": [NSString stringWithFormat:@"sacallback_%@", callback]
                           };
    sendToUnity1(unityName, data);
    
}
