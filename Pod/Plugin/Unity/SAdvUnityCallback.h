/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>

// forward declaration of this method - which is part of the Unity C
// libray, so it would be available there
void UnitySendMessage(const char *identifier, const char *function, const char *payload);

/**
 * Generic method used to send messages back to unity
 *
 * @param unityName the name of the unity ad to send the message back to
 * @param payload   the data to send back
 */
static inline void sendToUnity1 (NSString *unityName, NSString *payload) {
    
    const char *name = [unityName UTF8String];
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
    
    NSString *payload = [NSString stringWithFormat:@"{\"success\":\"%d\", \"type\":\"sacallback_%@\"}", success, callback];
    sendToUnity1(unityName, payload);
}
