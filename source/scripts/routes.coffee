angular.module "Routes", []

.config ($routeProvider)->
   $routeProvider
      .when "/",
         controller: "ShopCtrl"
         templateUrl: "shop.html"
      .when "/about",
         controller: "AboutCtrl"
         templateUrl: "about.html"
      .when "/events",
         controller: "EventsCtrl"
         templateUrl: "events.html"
      .when "/locations",
         controller: "LocationsCtrl"
         templateUrl: "locations.html"
      .when "/wholesale",
         controller: "WholesaleCtrl"
         templateUrl: "wholesale.html"
      .otherwise
         redirectTo: "/"
