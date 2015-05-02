angular.module "Shop", []

.controller "ShopCtrl", ($scope)->
   $scope.products = [
      {
         variations: [
            {
               hero:"assets/raw-ring.jpg"
            }
         ]
      }
      
      {
         variations: [
            {
               hero:"assets/coffee-and-crystals-green-turquoise.jpg"
            }
         ]
      }
   ]
