/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions2.h"
#import "SAdvAIRVerifyInstall.h"

/**
 * Method that initialzies an AIR Context by specifying all methods that should
 * talk in the AIR-iOS relationship
 *
 * @param extData               context data
 * @param ctxType               context type
 * @param ctx                   actual context
 * @param numFunctionsToTest    functions in program
 * @param functionsToSet        functions to set
 */
void SAdvContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    *numFunctionsToTest = 1;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    func[0].name = (const uint8_t*) "SuperAwesomeAdvertiserAIRSAVerifyInstall";
    func[0].functionData = NULL;
    func[0].function = &SuperAwesomeAdvertiserAIRSAVerifyInstall;
    
    *functionsToSet = func;
}

/**
 * Main method that initializes the whole extension context
 *
 * @param extDataToSet          data to set
 * @param ctxInitializerToSet   context initializer function pointer
 * @param ctxFinalizerToSet     context finalizer function pointer
 */
void SAdvExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet){
    *extDataToSet = NULL;
    *ctxInitializerToSet = &SAdvContextInitializer;
}
