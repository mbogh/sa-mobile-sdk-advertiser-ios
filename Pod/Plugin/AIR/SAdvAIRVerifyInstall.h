/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions2.h"

/**
 * Native method called from AIR that handles CPI
 *
 * @param ctx       current FREContext object
 * @param funcData  pointer to extra data
 * @param argc      argc paramter
 * @param argv      argv paramter
 * @return          a new FREObject instance with return data
 */
FREObject SuperAwesomeAdvertiserAIRSAVerifyInstall (FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
