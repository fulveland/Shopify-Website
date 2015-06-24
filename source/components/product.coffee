angular.module "Product", []

.directive "product", ()->
  templateUrl: "product.html"
  
  controller: ($scope)->
    
    ## LOCALS
    productIndex = $scope.$index
    
    
    ## SCOPE LOCALS
    $scope.variation = $scope.product.variations[0]
    
    
    ## HELPERS
    getVariation = (variationIndex)->
      variations = $scope.product.variations
      return variations[(variationIndex + variations.length) % variations.length]
    
    
    ## SCOPE
    $scope.variationsCount = ()->
      return $scope.product.variations.length
    
    $scope.getHero = (variationIndex)->
      return getVariation(variationIndex)?.hero
    
    $scope.getVerticalPositionStyle = ()->
      ypos = if $scope.infoIsOpen(productIndex) then $scope.product.ypos else 0
      translate = "translate(-50%, -#{ypos}%)"
      return style =
        transform: translate
        "-webkit-transform": translate
    
    $scope.changeVariation = (variationIndex)->
      $scope.variation = getVariation(variationIndex)
