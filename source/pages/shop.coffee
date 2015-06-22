angular.module "Shop", []

.controller "ShopCtrl", (Products, $scope)->
  $scope.products = Products.all()
