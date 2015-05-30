angular.module "Shop", []

.controller "ShopCtrl", (Products, $scope)->
  resetCallback = null
  
  $scope.products = Products.all()
  
  # This stores the index of the current variation of each product that we're looking at. They all start at 0.
  $scope.currentVariations = (0 for product in $scope.products)
  
  $scope.changeVariation = (productIndex, change, resetCb)->
    
    resetCallback = resetCb
    $scope.currentVariations[productIndex] -= change
    
  $scope.getVariation = (productIndex, offset)->
    
    resetCallback?()
    resetCallback = null
    
    product = $scope.products[productIndex]
    nVariations = product.variations.length
    
    variationIndex = $scope.currentVariations[productIndex] + offset
    
    # This line of code gives us a valid variation even if we go past the end of the array in either direction.
    realIndex = (variationIndex + nVariations) % nVariations
    return $scope.products[productIndex].variations[realIndex]
