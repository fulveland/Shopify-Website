angular.module "Shop", []

.controller "ShopCtrl", ($scope)->
   $scope.products = [
      {
         variations: [
            {
               hero:"assets/raw-ring.jpg"
            }
            {
               hero:"assets/coffee-and-crystals-green-turquoise.jpg"
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
   
   # This should be the same length as $scope.products.
   # It stores which variation of each product we're currently looking at.
   currentVariations = [
      0
      0
   ]
   
   $scope.getVariation = (productIndex, offset)->
      product = $scope.products[productIndex]
      nVariations = product.variations.length
      
      variationIndex = currentVariations[productIndex] + offset
      
      # This line of code gives us a valid variation even if we go past the end of the array in either direction.
      realIndex = (variationIndex + nVariations) % nVariations
      return $scope.products[productIndex].variations[realIndex]
