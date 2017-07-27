/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>
#import "SAInstall.h"

@interface SAVerifyInstall : NSObject

/**
 * Singleton method to get the only existing instance
 *
 * @return an instance of the SACPI class
 */
+ (instancetype) getInstance;

/**
 * Main class method that handles all the aspects of properly sending 
 * an /install event
 * This method also assumes a production session, so users 
 * won't have to set their own session.
 *
 * @param response a callback block of type saDidCountAnInstall
 */
- (void) handleInstall: (saDidCountAnInstall) response;

/**
 * Main class method that handles all the aspects of properly sending
 * an /install event
 * This method also assumes a production session, so users
 * won't have to set their own session.
 *
 * @param session  a current session
 * @param response a callback block of type saDidCountAnInstall
 */
- (void) handleInstall: (SASession*) session
          withResponse: (saDidCountAnInstall) response;


/**
 * Main class method that handles all the aspects of properly sending
 * an /install event
 * This method also assumes a production session, so users
 * won't have to set their own session.
 *
 * @param session  a current session
 * @param target   the app that's just been installed
 * @param response a callback block of type saDidCountAnInstall
 */
- (void) handleInstall: (SASession*) session
            withTarget: (NSString*) target
           andResponse: (saDidCountAnInstall) response;

@end
