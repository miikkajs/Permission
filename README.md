# Permission

This plugin defines a global `Permission` object, which provides an API for asking permissions and getting permission status.

## Installation

    cordova plugin add https://github.com/miikkajs/Permission.git

## API
- Permission
    - getPermissionStatus
    - askPermission
    - openSettings



## Permission.getPermissionStatus(type, callback)

Returns status of current permission.

###type

- `Permission.TYPE_CAMERA`
- `Permission.TYPE_MIC`

###callback
  1. error
  2. status
    - `AVAuthorizationStatusNotDetermined`  Indicates that the user has not yet made a choice regarding whether the client can access the hardware.
    - `AVAuthorizationStatusRestricted` The client is not authorized to access the hardware for the media type. The user cannot change
                                         the client's status, possibly due to active restrictions such as parental controls being in place.
    - `AVAuthorizationStatusDenied` The user explicitly denied access to the hardware supporting a media type for the client.
    - `AVAuthorizationStatusAuthorized` The client is authorized to access the hardware supporting a media type.

## Permission.askPermission(type, callback)

Opens dialog for permission control.

###type

- `Permission.TYPE_CAMERA`
- `Permission.TYPE_MIC`

###callback
Does nothing :(

## Permission.openSettings()

Opens settings application.


#### Supported Platforms

iOS

#### Example

Gets camera's permission status and then asks permission or opens settings application.

     Permission.getPermissionStatus(Permission.TYPE_CAMERA, function (err, res) {
            if (err) {
            //Error
            } else {
              if (res == Permission.STATUS.AVAuthorizationStatusNotDetermined) {
                Permission.askPermission(Permission.TYPE_CAMERA, function (err, res) {
                //Actually this doesn't fire ATM.
                })
              } else if (res == Permission.STATUS.AVAuthorizationStatusDenied) {
                Permission.openSettings();
              }
            }
          })