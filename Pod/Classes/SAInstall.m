/**
 * @Copyright:   SuperAwesome Trading Limited 2017
 * @Author:      Gabriel Coman (gabriel.coman@superawesome.tv)
 */

#import "SAInstall.h"

#if defined(__has_include)
#if __has_include(<SANetworking/SANetwork.h>)
#import <SANetworking/SANetwork.h>
#else
#import "SANetwork.h"
#endif
#endif

#if defined(__has_include)
#if __has_include(<SAUtils/SAUtils.h>)
#import <SAUtils/SAUtils.h>
#else
#import "SAUtils.h"
#endif
#endif

#if defined(__has_include)
#if __has_include(<SAJsonParser/NSDictionary+SAJson.h>)
#import <SAJsonParser/NSDictionary+SAJson.h>
#else
#import "NSDictionary+SAJson.h"
#endif
#endif

#if defined(__has_include)
#if __has_include(<SAJsonParser/NSDictionary+SafeHandling.h>)
#import <SAJsonParser/NSDictionary+SafeHandling.h>
#else
#import "NSDictionary+SafeHandling.h"
#endif
#endif

@interface SAInstall ()

// local instance of the networking class
@property (nonatomic, strong) SANetwork *network;

@end

@implementation SAInstall

/**
 * Classic init method
 */
- (id) init {
    if (self = [super init]) {
        _network = [[SANetwork alloc] init];
    }
    
    return self;
}

- (NSString*) getInstallUrl:(SASession *)session {
    if (session) {
        return [NSString stringWithFormat:@"%@/install", [session getBaseUrl]];
    } else {
        return nil;
    }
}

- (NSDictionary*) getInstallQuery:(NSString *)targetPackageName {
    if (targetPackageName) {
        return @{ @"bundle" : targetPackageName };
    } else {
        return @{};
    }
}

- (NSDictionary*) getInstallHeader {
    return @{
             @"Content-Type": @"application/json",
             @"User-Agent": [SAUtils getUserAgent]
             };
}

- (BOOL) parseServerResponse:(NSString *)serverResponse {
    
    // get the response as a dictionary object
    NSDictionary *response = [[NSDictionary alloc] initWithJsonString:serverResponse];
    
    // and try to parse it as a boolean
    return [response safeBoolForKey:@"success" orDefault:false];
}

- (void) sendInstallEventToServer:(NSString *)targetPackageName
                      withSession:(SASession *)session
                      andResponse:(saDidCountAnInstall)response {
    
    // get the event url
    NSString *url = [self getInstallUrl:session];
    
    // get the query
    NSDictionary *query = [self getInstallQuery:targetPackageName];
    
    // get the header
    NSDictionary *header = [self getInstallHeader];
    
    // send the GET request and await a result
    [_network sendGET:url withQuery:query andHeader:header withResponse:^(NSInteger status, NSString *payload, BOOL success) {
       
        // send back a response
        if (response) {
            response ([self parseServerResponse:payload]);
        }
        
    }];
    
}

@end
