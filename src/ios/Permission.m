//
//  Permission.m
//
//  Created by Miikka Salomaa on 04/08/15.
//
//

#import "Permission.h"
#import <Foundation/Foundation.h>
@implementation Permission
const NSString *TYPE_CAMERA = @"camera";

- (void)isPermissionGranted:(CDVInvokedUrlCommand*)command{
   CDVPluginResult* pluginResult = nil;
   NSString* type = [command.arguments objectAtIndex:0];
    
    if([TYPE_CAMERA isEqualToString:type]){
          pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(  [self checkCameraAuthorizationStatus])];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) askPermission:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* pluginResult = nil;
    NSString* type = [command.arguments objectAtIndex:0];
    if([TYPE_CAMERA isEqualToString:type]){
        [self askCameraPermission];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (BOOL)checkCameraAuthorizationStatus
{
    AVAuthorizationStatus authStatusCamera = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatusCamera == AVAuthorizationStatusAuthorized){
      
        return true;
    }
    return false;
}

- (void)askCameraPermission
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        if(!granted){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        } else {
            
        }
    }];
}

@end


