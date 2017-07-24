/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>

#if defined(__has_include)
#if __has_include(<SASession/SASession.h>)
#import <SASession/SASession.h>
#else
#import "SASession.h"
#endif
#endif

// callback block to send back envets back to the SDK users
typedef void (^saDidCountAnInstall)(BOOL success);

/**
 * Class that contains methods to generate all necessary GET request 
 * elements for an install event:
 * - the install event url
 * - the install event additional url query, containing at least a 
 *   "?bundle=just.installed.app"
 *   part and additionally, an "&sourceBundle=source.of.install" part
 *   Thus the url will be 
 *   /install?bundle=just.installed.app&sourceBundle=source.of.install
 * - the install header, as a JSONObject
 */
@interface SAInstall : NSObject

/**
 * Get the base install url
 *
 * @param session current session
 * @return        an url of one of two forms:
 *                - https://ads.superawesome.tv/v2/install
 *                - https://ads.staging.superawesome.tv/v2/install
 */
- (NSString*) getInstallUrl: (SASession*) session;

/**
 * Get the additional install query
 *
 * @param targetPackageName the package name of the app that's just been 
 *                          installed on a user's device; 
 *                          this is a string of the form com.example.my.app
 * @return                  a dictionary like this
 *                          - {
 *                              "bundle": "com.example.my.app"
 *                            }
 */
- (NSDictionary*) getInstallQuery: (NSString*) targetPackageName;

/**
 * Get the install header needed for the GET operation 
 * to the Awesome Ads server
 *
 * @return  a JSONObject used as a header for the GET operation. 
 *          It'll look something like this:
 *          {
 *              "Content-Type" : "application/json",
 *              "User-Agent" : "Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19"
 *          }
 */
- (NSDictionary*) getInstallHeader;

/**
 * Method that parser the server response for an "/install" GET event call.
 *
 * @param serverResponse the server response, as a string; 
 *                       it usually is of the form:
 *                       - { "success" : true }
 *                       - { "success" : false }
 *                       but if the ad server responde with 404 or 400 
 *                       or another error code, it could also be null.
 * @return               true or false, depending on the actual string
 */
- (BOOL) parseServerResponse: (NSString*) serverResponse;

/**
 * Method that actually sends an install event to the server, based on a number of
 * parameters.
 *
 * @param targetPackageName the package name of the app just being installed
 *                          current app to be installed
 * @param session           the current session
 * @param response          a callback block of type saDidCountAnInstall
 */
- (void) sendInstallEventToServer: (NSString*) targetPackageName
                      withSession: (SASession*) session
                      andResponse: (saDidCountAnInstall) response;

@end
