angular.module "VariationContainer", []

.directive "variationContainer", ($swipe, $timeout, ScrollAnimation)->
  templateUrl: "variation-container.html"
  
  link: (scope, element)->
    
    ## CONFIG
    animationTime = 400
    animString = " #{animationTime}ms cubic-bezier(.16,.56,.5,1)" # Must begin with a space
    wrapping = true
        
    
    ## STATE
    dragStart = 0
    # The offset values describe how many images we've shifted left (-) or right (+)
    scope.offset = 0
    scope.offsetA = 0
    scope.offsetB = 0
    scope.offsetC = 0
    
    
    ## REFERENCES
    productIndex = scope.$index
    nVariations = scope.variationsCount(productIndex)
    
    sliderNG = element.children().children()
    slider = sliderNG[0]
    
    A = B = C = null
    for child in slider.children
      switch child.className
        when "variation A" then A = child
        when "variation B" then B = child
        when "variation C" then C = child
    
    
    ## HELPERS
    
    setVariation = (variation, prop, value)->
      variation.style["-webkit-"+prop] = value
      variation.style["-ms-"+prop] = value
      variation.style[prop] = value
    
    setSlider = (prop, value, addPrefixToValue = false)->
      slider.style["-webkit-"+prop] = (if addPrefixToValue then "-webkit-"+value else value)
      slider.style["-ms-"+prop] = (if addPrefixToValue then "-ms-"+value else value)
      slider.style[prop] = value
    
    clip = (v, min, max)->
      Math.min(Math.max(v, min), max)
    
    
    ## LOGIC
    
    adjustOffsets = (delta)->
      scope.offset += delta
      if not wrapping
        scope.offset = clip scope.offset, -nVariations+1, 0
      scope.offsetA = Math.floor((-scope.offset+2)/3)*3
      scope.offsetB = Math.floor((-scope.offset+1)/3)*3
      scope.offsetC = Math.floor((-scope.offset+0)/3)*3
      
      # Function no longer exists
      # scope.changeVariation(productIndex, scope.offset)
    
    enableTransition = (enable = true)->
      setSlider "transition", (if enable then "transform" + animString else null), true
      A.style.transition = (if enable then "opacity" + animString else null)
      B.style.transition = (if enable then "opacity" + animString else null)
      C.style.transition = (if enable then "opacity" + animString else null)
    
    applyTranslate = (x)->
      x += scope.offset * slider.offsetHeight
      setSlider "transform", "translateX(#{x}px)"
      setVariation A, "transform", "translateX(#{scope.offsetA * slider.offsetHeight}px)"
      setVariation B, "transform", "translateX(#{scope.offsetB * slider.offsetHeight}px)"
      setVariation C, "transform", "translateX(#{scope.offsetC * slider.offsetHeight}px)"
    
    applyOpacity = (v)->
      v += scope.offset
      A.style.opacity = 1 - Math.abs (v + scope.offsetA - 1) / 1.25
      B.style.opacity = 1 - Math.abs (v + scope.offsetB)     / 1.25
      C.style.opacity = 1 - Math.abs (v + scope.offsetC + 1) / 1.25
    
    setSliderPosition = (x)->
      applyTranslate x
      applyOpacity x / slider.offsetHeight
    
    resetSliderPosition = ()->
      setSliderPosition(0)
    
    ## SWIPE HANDLERS
    
    handlers =
      start: (pos, event)->
        dragStart = pos.x
        enableTransition false
        
      move: (pos)->
        x = pos.x - dragStart
        setSliderPosition x
        
      end: (pos)->
        x = pos.x - dragStart
        enableTransition true
        if x >  slider.offsetHeight / 5 then adjustOffsets 1
        if x < -slider.offsetHeight / 5 then adjustOffsets -1
        scope.$apply ()-> resetSliderPosition()
    
    
    ## SWIPE SETUP
    
    $swipe.bind sliderNG, handlers, ["touch"]
    
    
    ## SCOPE FUNCTIONS
    
    scope.clickAction = (shift)->
      if shift > 0
        enableTransition()
        adjustOffsets -1
        resetSliderPosition()
      else if shift < 0
        enableTransition()
        adjustOffsets 1
        resetSliderPosition()
      else
        scope.toggleProductInfo(productIndex, scope)
    
    scope.getClass = (shift)->
      if shift > 0
        "next"
      else if shift < 0
        "prev"
      else
        "current"
