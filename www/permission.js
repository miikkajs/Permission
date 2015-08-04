var Permission = function () {
  var _this = this;


  _this.isPermissionGranted = function (type, cb) {
    cordova.exec(function (res) {
        cb(undefined,res)
      }, function (err) {
        cb(err)
      },
      'Permission',
      'isPermissionGranted',
      [type])
  };

  _this.askPermission = function (type, cb) {

    cordova.exec(function(res){
        cb(undefined,res)
      }, function(err){
        cb(err)
      },
      'Permission',
      'askPermission',
      [type])
  };


  return _this;
}





Permission.prototype.TYPE_CAMERA = "camera";
Permission.prototype.TYPE_MIC = "mic";

module.exports = new Permission()