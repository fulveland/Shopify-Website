angular.module "PureMath", []

.service "PureMath", ()->
	return PureMath =
	  clip: (input, min = 0, max = 1)->
	    return min if input < min
	    return max if input > max
	    return input
