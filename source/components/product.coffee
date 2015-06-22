angular.module "Product", []

.directive "product", ()->
  templateUrl: "product.html"
  controller: ($scope)->
    showingProduct =
      index: null
      scope: null
    
    $scope.variationsCount = (productIndex)->
      return $scope.products[productIndex].variations.length
    
    $scope.getVariation = (productIndex, variationIndex)->
      variations = $scope.products[productIndex].variations
      return variations[(variationIndex + variations.length) % variations.length] or {}
    
    $scope.hasVariation = (productIndex, variationIndex)->
      variations = $scope.products[productIndex].variations
      return variations[(variationIndex + variations.length) % variations.length]?
    
    $scope.toggleProductInfo = (productIndex, productScope)->
      showingProduct.scope?.showingProductInfo = false
      
      if showingProduct.index is productIndex
        showingProduct.index = null
        showingProduct.scope = null
      else
        showingProduct.index = productIndex
        showingProduct.scope = productScope
        showingProduct.scope?.showingProductInfo = true
        
    $scope.getStyle = (productIndex)->
      if showingProduct.index is productIndex
        ypos = $scope.products[productIndex].ypos
        return style =
          transform: "translateY(-#{ypos}%)"
          "-webkit-transform": "translateY(-#{ypos}%)"
