/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import "SuperAwesomeAdvertiser.h"
#import "SAOnce.h"

@implementation SuperAwesomeAdvertiser

+ (instancetype) getInstance {
    static SuperAwesomeAdvertiser *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

/**
 * Private constructor that is only called once
 */
- (id) init {
    if (self = [super init]) {
        // do nothing
    }
    
    return self;
}

- (void) handleInstall:(saDidCountAnInstall)response {
    SASession *session = [[SASession alloc] init];
    [session setConfigurationProduction];
    [self handleInstall:session withResponse:response];
}

- (void) handleInstall:(SASession *)session
          withResponse:(saDidCountAnInstall)response {
    [self handleInstall:session
             withTarget:[session getBundleId]
            andResponse:response];
}

- (void) handleInstall:(SASession *)session
            withTarget:(NSString *)target
           andResponse:(saDidCountAnInstall)response {
    
    __block SAOnce    *once    = [[SAOnce alloc] init];
    SAInstall *install = [[SAInstall alloc] init];
    
    // check to see if the CPI event has already been sent
    BOOL isSent = [once isCPISent];
    
    // if it hasn't ...
    if (!isSent) {
        
        // proceed with sending the install event
        [install sendInstallEventToServer:target
                              withSession:session
                              andResponse:^(BOOL success) {
                                 
                                  // and once done, set the CPI event as sent
                                  [once setCPISent];
                                  
                                  // and send back a response to the user
                                  if (response) {
                                      response (success);
                                  }
                                  
                              }];
        
    }
    
}

@end
