angular.module "ScrollAnimation", []



# This service is an interface between the ScrollAnimation directive and the outside world
.service "ScrollAnimation", ()->
  animateFn = null
  
  return ScrollAnimation =
    
    # When the directive is ready, it will register itself here
    register: (a)->
      animateFn = a
    
    animate: (startScroll, endScroll)->
      if animateFn? # Don't run if we're not ready
        animateFn(startScroll, endScroll)



# This directive should be placed on ONE element (probably the body) which will be the subject of scroll animations
.directive "scrollAnimation", (Ease, ScrollAnimation)->
  controller: ($element)->
    
    # Local variables
    THRESHOLD = 50
    SCROLL_ANIMATION_SPEED = 500
    startTime = endTime = startScroll = endScroll = null
    subject = $element[0]
    
    # This function runs the scroll animation
    tick = (currentTime)->
      subject.scrollTop = Ease.cubic(currentTime, startTime, endTime, startScroll, endScroll, true)
      if currentTime < endTime
        requestAnimationFrame(tick)
    
    # This function sets up our timing, and then runs a normal tick
    firstTick = (currentTime)->
      startTime = currentTime
      duration = Math.sqrt(Math.abs((endScroll - startScroll) * SCROLL_ANIMATION_SPEED))
      endTime = startTime + duration
      tick(currentTime)
    
    # This function begins a new scroll animation
    animateFn = (sS, eS)->
      startScroll = sS#subject.scrollTop
      endScroll = eS
      if Math.abs(startScroll - endScroll) > THRESHOLD
        requestAnimationFrame(firstTick)
    
    # Tell the ScrollAnimation service which function to call to begin an animation
    ScrollAnimation.register(animateFn)
