angular.module "Shop", []

.controller "ShopCtrl", (Products, $scope)->
  $scope.showProductInfo = false
  $scope.products = Products.all()
  
  # This stores the index of the current variation of each product that we're looking at. They all start at 0.
  $scope.currentVariations = (0 for product in $scope.products)
  
  $scope.changeVariation = (productIndex, change)->
    $scope.currentVariations[productIndex] += change
  
  $scope.getVariation = (productIndex, variationIndex)->
    product = $scope.products[productIndex]
    nVariations = product.variations.length
    realIndex = (variationIndex + nVariations) % nVariations
    return $scope.products[productIndex].variations[realIndex]
