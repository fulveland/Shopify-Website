angular.module "Variation", []

.directive "variation", ()->
	scope:
		variation: "=data"
	templateUrl: "variation.html"
