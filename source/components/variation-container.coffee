angular.module "VariationContainer", []

.directive "variationContainer", ($swipe)->
  templateUrl: "variation-container.html"
  link: (scope, element, attrs)->
    productIndex = scope.$index
    actual = target = start = 0
    epsilon = 1
    direction = 0
    willUpdate = false
    slider = element.children().children()
    before = prev = current = next = after = null
    size = null
    
    for child in slider.children()
      switch child.className
        when "variation before" then before = child
        when "variation prev" then prev = child
        when "variation current" then current = child
        when "variation next" then next = child
        when "variation after" then after = child
    
    apply = (v)->
      t = "translateX(#{v}px)"
      slider.css "transform", t
      slider.css "-webkit-transform", t

      frac = v / size
      before.style.opacity = frac * 0.2
      prev.style.opacity = frac * 0.8 + 0.2
      current.style.opacity = 1 - Math.abs(frac) * 0.8
      next.style.opacity = -frac * 0.8 + 0.2
      after.style.opacity = -frac * 0.2
    
    reset = ()->
      actual = 0
      requestAnimationFrame ()-> apply(actual)
    
    finish = ()->
      scope.$apply ()->
        if direction != 0
          scope.changeVariation(productIndex, direction, reset)
    
    update = ()->
      willUpdate = false
      delta = target - actual
      if Math.abs(delta) > epsilon
        actual += delta / 5
        apply(actual)
        requestUpdate()
      else
        finish()

    requestUpdate = ()->
      unless willUpdate
        willUpdate = true
        window.requestAnimationFrame(update)
    
    handlers =
      start: (p, e)->
        start = p.x
        size = slider[0].offsetHeight
        e.preventDefault()
        
      move: (p)->
        x = p.x - start
        apply(x)
        
      end: (p)->
        actual = p.x - start
        if Math.abs(actual) > size / 5
          if actual < 0
            direction = -1
            target = -size
          else
            direction = 1
            target = size
        else
          direction = 0
          target = 0
        requestUpdate()
        
        
    $swipe.bind slider, handlers, ["mouse", "touch"]
