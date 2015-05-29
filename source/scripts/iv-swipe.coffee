angular.module "ivSwipe", []

.factory "ivSwipe", ()->
  # The total distance in any direction before we make the call on swipe vs. scroll.
  MOVE_BUFFER_RADIUS = 10
  
  POINTER_EVENTS =
    mouse:
      start: "mousedown"
      move: "mousemove"
      end: "mouseup"
    touch:
      start: "touchstart"
      move: "touchmove"
      end: "touchend"
      cancel: "touchcancel"
  
  getCoordinates = (event)->
    originalEvent = event.originalEvent or event
    touches = if originalEvent.touches and originalEvent.touches.length then originalEvent.touches else [originalEvent]
    e = (originalEvent.changedTouches and originalEvent.changedTouches[0]) or touches[0]
    return x: e.clientX, y: e.clientY, e: e
  
  getEvents = (pointerTypes, eventType)->
    res = []
    for pointerType in pointerTypes
      eventName = POINTER_EVENTS[pointerType][eventType]
      if eventName
        res.push eventName
    return res.join " "
  
  return ivSwipe =
    bind: (element, eventHandlers)->
      # Absolute total movement, used to control swipe vs. scroll.
      totalX = null
      totalY = null
      # Coordinates of the start position.
      startCoords = null
      # Last event's position.
      lastPos = null
      # Whether a swipe is active.
      active = false
      
      element.on ["mousedown", "touchstart"], (event)->
        startCoords = getCoordinates(event)
        active = true
        totalX = 0
        totalY = 0
        lastPos = startCoords
        eventHandlers["start"]?(startCoords, event)
      
      events = getEvents(pointerTypes, "cancel")
      if (events)
        element.on events, (event)->
          active = false
          eventHandlers["cancel"]?(event)
      
      element.on getEvents(pointerTypes, "move"), (event)->
        return unless active
        
        # Android will send a touchcancel if it thinks we"re starting to scroll.
        # So when the total distance (+ or - or both) exceeds 10px in either direction,
        # we either:
        # - On totalX > totalY, we send preventDefault() and treat this as a swipe.
        # - On totalY > totalX, we let the browser handle it as a scroll.
        
        return unless startCoords
        coords = getCoordinates(event)
        
        totalX += Math.abs(coords.x - lastPos.x)
        totalY += Math.abs(coords.y - lastPos.y)
        
        lastPos = coords
        
        return if totalX < MOVE_BUFFER_RADIUS and totalY < MOVE_BUFFER_RADIUS
        
        # One of totalX or totalY has exceeded the buffer, so decide on swipe vs. scroll.
        if totalY > totalX
          # Allow native scrolling to take over.
          active = false
          eventHandlers?["cancel"](event)
          
        else
          # Prevent the browser from scrolling.
          event.preventDefault()
          eventHandlers["move"]?(coords, event)
      
      element.on getEvents(pointerTypes, "end"), (event)->
        if active
          active = false
          eventHandlers["end"]?(getCoordinates(event), event)
