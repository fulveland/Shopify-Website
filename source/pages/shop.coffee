PureMath =
  
  clip: (input, min = 0, max = 1)->
    return min if input < min
    return max if input > max
    return input


Ease =

   cubic: (input, inputMin = 0, inputMax = 1, outputMin = 0, outputMax = 1, clip = true)->
         Ease.power(input, 3, inputMin, inputMax, outputMin, outputMax, clip)

   power: (input, power = 1, inputMin = 0, inputMax = 1, outputMin = 0, outputMax = 1, clip = true)->
         return outputMin if inputMin is inputMax # Avoids a divide by zero
         input = PureMath.clip(input, inputMin, inputMax) if clip
         outputDiff = outputMax - outputMin
         inputDiff = inputMax - inputMin
         p = (input-inputMin) / (inputDiff/2)
         if p < 1
           return outputMin + outputDiff/2 * Math.pow(p, power)
         else
           return outputMin + outputDiff/2 * (2 - Math.abs(Math.pow(p-2, power)))



SCROLL_ANIMATION_SPEED = 500
startTime = endTime = null
startScroll = endScroll = null
duration = null

animate = (currentTime)->
   startTime ?= currentTime
   endTime ?= startTime + duration
   document.body.scrollTop = Ease.cubic(currentTime, startTime, endTime, startScroll, endScroll, true)
   requestAnimationFrame(animate) if currentTime < endTime






angular.module "Shop", []

.directive "scrollJack", ()->
   controller: ($scope, $element)->
      $element.on "click", ()->
         if !$scope.showing
            startScroll = document.body.scrollTop
            rect = $element[0].getBoundingClientRect()
            endScroll = rect.bottom + document.body.scrollTop - rect.height / 4
            return if startScroll is endScroll
            startTime = endTime = null
            duration = Math.sqrt(Math.abs((endScroll - startScroll) * SCROLL_ANIMATION_SPEED))
            requestAnimationFrame(animate)


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
