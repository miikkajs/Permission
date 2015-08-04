var Permission = function () {
  var _this = this;


  _this.getPermissionStatus = function (type, cb) {
    cordova.exec(function (res) {
        cb(undefined,res)
      }, function (err) {
        cb(err)
      },
      'Permission',
      'getPermissionStatus',
      [type]);
  };

  _this.askPermission = function (type, cb) {

    cordova.exec(function(res){
        cb(undefined,res)
      }, function(err){
        cb(err)
      },
      'Permission',
      'askPermission',
      [type]);
  };

  _this.openSettings = function(cb){
    cordova.exec(function(res){
        cb(undefined,res)
      }, function(err){
        cb(err)
      },
      'Permission',
      'openSettings');
  };


  return _this;
};





Permission.prototype.TYPE_CAMERA = "camera";
Permission.prototype.TYPE_MIC = "mic";

/*@constant AVAuthorizationStatusNotDetermined
 Indicates that the user has not yet made a choice regarding whether the client can access the hardware.
 @constant AVAuthorizationStatusRestricted
 The client is not authorized to access the hardware for the media type. The user cannot change
 the client's status, possibly due to active restrictions such as parental controls being in place.
 @constant AVAuthorizationStatusDenied
 The user explicitly denied access to the hardware supporting a media type for the client.
 @constant AVAuthorizationStatusAuthorized
 The client is authorized to access the hardware supporting a media type.
 */
Permission.prototype.STATUS = {
  AVAuthorizationStatusNotDetermined: 0,
  AVAuthorizationStatusRestricted: 1,
  AVAuthorizationStatusDenied: 2,
  AVAuthorizationStatusAuthorized: 3

}

module.exports = new Permission()