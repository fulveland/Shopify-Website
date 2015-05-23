angular.module "Shop", []

.controller "ShopCtrl", (Products, $scope)->
   $scope.products = Products.all()
   
   # This stores the index of the current variation of each product that we're looking at. They all start at 0.
   currentVariations = (0 for product in $scope.products)
   
   $scope.getVariation = (productIndex, offset)->
      product = $scope.products[productIndex]
      nVariations = product.variations.length
      
      variationIndex = currentVariations[productIndex] + offset
      
      # This line of code gives us a valid variation even if we go past the end of the array in either direction.
      realIndex = (variationIndex + nVariations) % nVariations
      return $scope.products[productIndex].variations[realIndex]
