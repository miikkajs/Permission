//
//  Permission.h
//
//

#ifndef Recruitby_net_Permission_h
#define Recruitby_net_Permission_h
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDVPlugin.h>

@interface Permission : CDVPlugin
extern const NSString *TYPE_CAMERA;
extern const NSString *TYPE_MIC;

-(void)getPermissionStatus:(CDVInvokedUrlCommand*)command;
-(void)askPermission:(CDVInvokedUrlCommand*)command;
-(void)openSettings:(CDVInvokedUrlCommand*)command;
@end


#endif
