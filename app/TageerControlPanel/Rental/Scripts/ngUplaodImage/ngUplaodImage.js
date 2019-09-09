angular.module("ngUplaodImage", []).directive('ngUplaodImage', function ($compile) {
    return {
        restrict: 'E',
        
        template: '<div></div>',
  
   
        replace: true,
       
        link: function ($scope, elem, attr, ctrl) {
            var elementUplaod = $(elem);
            elementUplaod.append(' <input type="file" class="btn"  name="' + attr.upName + '" accept="' + attr.upAccept + '" onchange="(angular.element(this).scope()).GetImageReview(this)"/>');
            $compile(elementUplaod)($scope);

            $scope.GetImageReview = function (elmentImage) {
                
       
             
                
                $scope[attr.upModelFile] = null;
                $scope[attr.upModelImage] = null;

                var file=elmentImage.files[0];
                var reader = new FileReader();
                reader.onload=function (event){
                    var pathImage = event.target.result;
                    $scope.$apply(function () {
                        $scope[attr.upModelFile] = file;
                        $scope[attr.upModelImage] = pathImage;
                    })
                
                };

                reader.readAsDataURL(file);
            };

         
        }
    };
})
.directive('ngUplaodImageBase', function ($compile) {
    return {
        restrict: 'E',
        template: '<div></div>',
        replace: true,
       
        link: function ($scope, elem, attr, ctrl) {
            var elementUplaod = $(elem);
            elementUplaod.append(' <input type="file" class="btn"  name="' + attr.upName + '" accept="' + attr.upAccept + '" onchange="(angular.element(this).scope()).GetImageReview(this)"/>');
            $compile(elementUplaod)($scope);

            $scope.GetImageReview = function (elmentImage) {
                
       
             
                
                $scope[attr.upModelFile] = null;
                $scope[attr.upModelImage] = null;

                var file=elmentImage.files[0];
                var reader = new FileReader();
                reader.onload=function (event){
                    var base64 = event.target.result;
                    $scope.$apply(function () {
                        $scope[attr.upModelFile] = base64;
                        $scope[attr.upModelImage] = base64;
                    })
                
                };

                reader.readAsDataURL(file);
            };

         
        }
    };
});

