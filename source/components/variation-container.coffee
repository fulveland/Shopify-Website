angular.module "VariationContainer", []

.directive "variationContainer", ($swipe)->
  templateUrl: "variation-container.html"
  link: (scope, element, attrs)->
    actual = target = start = 0
    epsilon = 0.5
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
    
    update = ()->
      willUpdate = false
      delta = target - actual
      if Math.abs(delta) > epsilon
        actual += delta / 5
        apply(actual)
        requestUpdate()
      else
        actual = 0
        apply(actual)

    requestUpdate = ()->
      unless willUpdate
        willUpdate = true
        window.requestAnimationFrame(update)
    
    handlers =
      start: (p, e)->
        start = p.x
        size = slider[0].offsetHeight
        # e.preventDefault()
        
      move: (p)->
        x = p.x - start
        apply(x)
        
      end: (p)->
        actual = p.x - start
        console.log size
        if Math.abs(actual) > size / 2
          if actual < 0
            target = -size
          else
            target = size
        else
          target = 0
        requestUpdate()
        
        
    $swipe.bind slider, handlers, ["touch"]
