angular.module "ScrollJack", []

.directive "scrollJack", (ScrollAnimation)->
	controller: ($scope, $element)->
		$element.on "click", ()->
			
			# THIS IS FRAGILE AND BAD
			if !$scope.showing
				
				rect = $element[0].getBoundingClientRect()
				endScroll = rect.bottom + document.body.scrollTop - rect.height / 4
				ScrollAnimation.animate(endScroll)
