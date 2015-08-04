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

  _this.askPermission = function (type) {
  };


  return _this;
}





Permission.prototype.CAMERA = "camera";

module.exports = new Permission()