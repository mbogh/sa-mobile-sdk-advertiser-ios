/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions2.h"
#import "SAdvAIRSuperAwesomeAdvertiser.h"

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
void SAContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    *numFunctionsToTest = 1;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
    func[0].name = (const uint8_t*) "SuperAwesomeAdvertiserAIRSACPIHandleInstall";
    func[0].functionData = NULL;
    func[0].function = &SuperAwesomeAdvertiserAIRSACPIHandleInstall;
    
    *functionsToSet = func;
}

/**
 * Main method that initializes the whole extension context
 *
 * @param extDataToSet          data to set
 * @param ctxInitializerToSet   context initializer function pointer
 * @param ctxFinalizerToSet     context finalizer function pointer
 */
void SAExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet){
    *extDataToSet = NULL;
    *ctxInitializerToSet = &SAContextInitializer;
}
