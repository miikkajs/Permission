//
//  Permission.h
//
//  Created by Miikka Salomaa on 04/08/15.
//
//

#ifndef Recruitby_net_Permission_h
#define Recruitby_net_Permission_h
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDVPlugin.h>

@interface Permission : CDVPlugin
extern const NSString *TYPE_CAMERA;
extern const NSString *TYPE_MIC;

-(void)isPermissionGranted:(CDVInvokedUrlCommand*)command;
-(void)askPermission:(CDVInvokedUrlCommand*)command;
@end


#endif
