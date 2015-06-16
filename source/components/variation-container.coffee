angular.module "VariationContainer", []

.directive "variationContainer", ($swipe, $timeout, Ease, ScrollAnimation)->
  templateUrl: "variation-container.html"
  link: (scope, element, attrs)->
    productIndex = scope.$index
    slider = element.children().children()
    A = B = C = null
    size = null
    dragStart = 0
    scope.offsetA = 0
    scope.offsetB = 0
    scope.offsetC = 0
    scope.offset = 0
    
    for child in slider.children()
      switch child.className
        when "variation A" then A = child
        when "variation B" then B = child
        when "variation C" then C = child
    
    updateOffsets = (delta)->
      scope.offset += delta
      scope.offsetA = Math.floor((-scope.offset+2)/3)*3
      scope.offsetB = Math.floor((-scope.offset+1)/3)*3
      scope.offsetC = Math.floor((-scope.offset+0)/3)*3
      scope.changeVariation(productIndex, scope.offset)
      
    updateSize = ()->
      size = slider[0].offsetHeight
    
    enableTransition = (enable)->
      A.style.transition = (if enable then "opacity .5s cubic-bezier(.16,.56,.5,1)" else null)
      B.style.transition = (if enable then "opacity .5s cubic-bezier(.16,.56,.5,1)" else null)
      C.style.transition = (if enable then "opacity .5s cubic-bezier(.16,.56,.5,1)" else null)
      
      slider.css "-webkit-transition", (if enable then "-webkit-transform .5s cubic-bezier(.16,.56,.5,1)" else null)
      slider.css "-moz-transition", (if enable then "-moz-transform .5s cubic-bezier(.16,.56,.5,1)" else null)
      slider.css "-ms-transition", (if enable then "-ms-transform .5s cubic-bezier(.16,.56,.5,1)" else null)
      slider.css "transition", (if enable then "transform .5s cubic-bezier(.16,.56,.5,1)" else null)
    
    applyTranslate = (x)->
      x += scope.offset * size
      slider.css "transform", "translateX(#{x}px)"
      slider.css "-ms-transform", "translateX(#{x}px)"
      slider.css "-webkit-transform", "translateX(#{x}px)"
      A.style["-webkit-transform"] = "translateX(#{scope.offsetA * size}px)"
      B.style["-webkit-transform"] = "translateX(#{scope.offsetB * size}px)"
      C.style["-webkit-transform"] = "translateX(#{scope.offsetC * size}px)"
    
    applyOpacity = (v)->
      v += scope.offset
      A.style.opacity = 1 - Math.abs (v + scope.offsetA - 1) / 1.25
      B.style.opacity = 1 - Math.abs (v + scope.offsetB) / 1.25
      C.style.opacity = 1 - Math.abs (v + scope.offsetC + 1) / 1.25
    
    apply = (x)->
      applyTranslate(x)
      applyOpacity(x/size)
    
    handlers =
      start: (pos, event)->
        dragStart = pos.x
        updateSize()
        enableTransition(false)
        # event.preventDefault() # Turn on for debugging
        
      move: (pos)->
        x = pos.x - dragStart
        apply(x)
        
      end: (pos)->
        x = pos.x - dragStart
        
        enableTransition(true)
        
        if Math.abs(x) > size / 5
          if x < 0
            updateOffsets(-1)
          else
            updateOffsets(1)
        scope.$apply ()->
          apply(0)
    
    $swipe.bind slider, handlers, ["touch"]
    
    scope.clickAction = (shift)->
      if shift > 0
        updateSize()
        enableTransition(true)
        updateOffsets(-1)
        apply(0)
      else if shift < 0
        updateSize()
        enableTransition(true)
        updateOffsets(1)
        apply(0)
      else
        scope.showProductInfo = !scope.showProductInfo
        if scope.showProductInfo
          rect = element[0].getBoundingClientRect()
          endScroll = rect.bottom + document.body.scrollTop - rect.height / 4
          ScrollAnimation.animate(endScroll)

    
    scope.getClass = (shift)->
      if shift > 0
        "next"
      else if shift < 0
        "prev"
      else
        "current"
