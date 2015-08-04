var Permission = function(){
  var _this = this;


  _this.isPermissionGranted = function(type){
    cordova.exec(function(res){

    }, function(err){

    }),
      'Permission',
      'isPermissionGranted',
      [type]
  };

  _this.askPermission = function(type){
  };


  return _this;
};

Permission.CAMERA = "camera";