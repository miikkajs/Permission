//
//  Permission.m
//
//

#import "Permission.h"
#import <Foundation/Foundation.h>
@implementation Permission
const NSString *TYPE_CAMERA = @"camera";
const NSString *TYPE_MIC = @"mic";

- (void)getPermissionStatus:(CDVInvokedUrlCommand*)command{
   CDVPluginResult* pluginResult = nil;
   NSString* type = [command.arguments objectAtIndex:0];
    
    if([TYPE_CAMERA isEqualToString:type]){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:(  [self checkCameraAuthorizationStatus])];
    }else if([TYPE_MIC isEqualToString:type]){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:(  [self checkMicAuthorizationStatus])];
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

    } else if([TYPE_MIC isEqualToString:type]){
        [self askMicPermission];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void) openSettings:(CDVInvokedUrlCommand *)command{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (int)checkCameraAuthorizationStatus
{
    AVAuthorizationStatus authStatusCamera = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    return (int)authStatusCamera;
}

- (int)checkMicAuthorizationStatus
{
    AVAuthorizationStatus authStatusMic = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    return (int) authStatusMic;
}

- (void)askCameraPermission
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        if(!granted){
            
        } else {
            
        }
    }];
}

- (void)askMicPermission
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        if(!granted){
     
        } else {
            
        }
        
    }];
}


@end


