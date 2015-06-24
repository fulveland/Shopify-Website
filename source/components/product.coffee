angular.module "Product", []

.directive "product", ()->
  templateUrl: "product.html"
  
  controller: ($scope)->
    showingProduct =
      index: null
      scope: null
    
    getVariation = (productIndex, variationIndex)->
      variations = $scope.products[productIndex].variations
      return variations[(variationIndex + variations.length) % variations.length]

    infoIsOpen = (productIndex)->
      return showingProduct.index is productIndex
    
    productYPos = (productIndex)->
      return $scope.products[productIndex].ypos
    
    getProduct = (productIndex)->
      return $scope.products[productIndex]
    
    $scope.variationsCount = (productIndex)->
      return getProduct(productIndex).variations.length
    
    $scope.getHero = (productIndex, variationIndex)->
      return getVariation(productIndex, variationIndex)?.hero
    
    $scope.getVerticalPositionStyle = (productIndex)->
      ypos = if infoIsOpen(productIndex) then productYPos(productIndex) else 0
      translate = "translate(-50%, -#{ypos}%)"
      return style =
        transform: translate
        "-webkit-transform": translate
    
    $scope.toggleProductInfo = (productIndex, productScope)->
      showingProduct.scope?.showingProductInfo = false
      
      if showingProduct.index is productIndex
        showingProduct.index = null
        showingProduct.scope = null
      else
        showingProduct.index = productIndex
        showingProduct.scope = productScope
        showingProduct.scope?.showingProductInfo = true
