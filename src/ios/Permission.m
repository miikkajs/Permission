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
const NSString *TYPE_MIC = @"mic";

- (void)isPermissionGranted:(CDVInvokedUrlCommand*)command{
   CDVPluginResult* pluginResult = nil;
   NSString* type = [command.arguments objectAtIndex:0];
    
    if([TYPE_CAMERA isEqualToString:type]){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(  [self checkCameraAuthorizationStatus])];
    }else if([TYPE_MIC isEqualToString:type]){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(  [self checkMicAuthorizationStatus])];
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

- (BOOL)checkCameraAuthorizationStatus
{
    AVAuthorizationStatus authStatusCamera = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatusCamera == AVAuthorizationStatusAuthorized){
      
        return true;
    }
    return false;
}

- (BOOL)checkMicAuthorizationStatus
{
    AVAuthorizationStatus authStatusMic = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if(authStatusMic == AVAuthorizationStatusAuthorized){
        
        return true;
    }
    return false;
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


