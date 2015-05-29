angular.module "VariationContainer", []

.directive "variationContainer", ()->
  templateUrl: "variation-container.html"
  link: (scope, element, attrs)->
    dragging = false
    dragged = false
    
    element.on "mousedown", (e)->
      e.preventDefault()
      dragging = true
      dragged = false
    
    element.on "mouseup", (e)->
      e.preventDefault()
      dragging = false
    
    element.on "mousemove", (e)->
      e.preventDefault()
    
      if dragging
        dragged = true
        # drag()
