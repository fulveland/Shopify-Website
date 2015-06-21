angular.module "Shop", []

.controller "ShopCtrl", (Products, $scope)->
  $scope.showProductInfo = false
  $scope.products = Products.all()
  
  # This stores the index of the current variation of each product that we're looking at. They all start at 0.
  $scope.currentVariations = (0 for product in $scope.products)
  
  $scope.variationsCount = (productIndex)->
    return $scope.products[productIndex].variations.length
  
  $scope.changeVariation = (productIndex, change)->
    $scope.currentVariations[productIndex] += change
  
  $scope.getVariation = (productIndex, variationIndex)->
    return $scope.products[productIndex].variations[variationIndex] or {}
  
  $scope.hasVariation = (productIndex, variationIndex)->
    return $scope.products[productIndex].variations[variationIndex]?
  
  showingProduct =
    index: null
    scope: null
  
  $scope.toggleProductInfo = (productIndex, productScope)->
    showingProduct.scope?.showProductInfo(false)
    
    if showingProduct.index is productIndex
      showingProduct.index = null
      showingProduct.scope = null
    else
      showingProduct.index = productIndex
      showingProduct.scope = productScope
      productScope.showProductInfo()
      
