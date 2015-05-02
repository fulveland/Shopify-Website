// Generated by CoffeeScript 1.9.2
(function() {
  angular.module("FehuApp", ["ngRoute", "ngTouch", "Variation", "About", "Locations", "Shop", "Wholesale", "PageStyle", "Routes"]);

  angular.module("PageStyle", []).directive("pageStyle", function($rootScope, $location) {
    return function(scope, elm, attrs) {
      return scope.$on("$routeChangeSuccess", function() {
        var path;
        path = $location.path().split("/")[1];
        if (path === "") {
          path = "shop";
        }
        return elm.prop("id", path);
      });
    };
  });

  angular.module("Routes", []).config(function($routeProvider) {
    return $routeProvider.when("/", {
      controller: "ShopCtrl",
      templateUrl: "shop.html"
    }).when("/about", {
      controller: "AboutCtrl",
      templateUrl: "about.html"
    }).when("/events", {
      controller: "EventsCtrl",
      templateUrl: "events.html"
    }).when("/locations", {
      controller: "LocationsCtrl",
      templateUrl: "locations.html"
    }).when("/wholesale", {
      controller: "WholesaleCtrl",
      templateUrl: "wholesale.html"
    }).otherwise({
      redirectTo: "/"
    });
  });

  angular.module("Variation", []).directive("variation", function() {
    return {
      scope: {
        variation: "=data"
      },
      templateUrl: "variation.html"
    };
  });

  angular.module("About", []).controller("AboutCtrl", function() {});

  angular.module("Events", []).controller("EventsCtrl", function() {});

  angular.module("Locations", []).controller("LocationsCtrl", function($scope) {
    var base, country, i, len, location, name, name1, province, ref;
    $scope.locations = [
      {
        "name": "Make at Granville Island",
        "url": "makevancouver.com",
        "address": "1648 Duranleau Street",
        "city": "Vancouver",
        "province": "British Columbia",
        "postal": "V6H 3S4",
        "country": "Canada"
      }, {
        "name": "Two Rivers Gallery",
        "url": "www.tworiversgallery.ca",
        "address": "725 Civic Plaza",
        "city": "Prince George",
        "province": "British Columbia",
        "postal": "V2L 5T1",
        "country": "Canada"
      }, {
        "name": "The Butcher's Daughter",
        "url": "www.facebook.com/TheButchersDaughterGiftShoppe",
        "address": "Saint John City Market\n47 Charlotte Street",
        "city": "Saint John",
        "province": "New Brunswick",
        "postal": "E2L 2H8",
        "country": "Canada"
      }, {
        "name": "Favourite",
        "url": "favouritegifts.ca",
        "address": "123 Carrie Cates Court",
        "city": "North Vancouver",
        "province": "British Columbia",
        "postal": "V7M 3K7",
        "country": "Canada"
      }, {
        "name": "Black Star",
        "url": "www.blackstarstudios.ca",
        "address": "1021 7th Avenue",
        "city": "Invermere",
        "province": "British Columbia",
        "postal": "V0A-1K0",
        "country": "Canada"
      }, {
        "name": "Siding 14",
        "url": "www.facebook.com/Siding14Gallery",
        "address": "5214 50 Street",
        "city": "Ponoka",
        "province": "Alberta",
        "postal": "T4J 1S1",
        "country": "Canada"
      }, {
        "name": "Whyte Museum",
        "url": "www.whyte.org",
        "address": "111 Bear St",
        "city": "Banff",
        "province": "Alberta",
        "postal": "T1L 1A3",
        "country": "Canada"
      }, {
        "name": "Made You Look",
        "url": "www.madeyoulook.ca",
        "address": "1338 Queen Street West",
        "city": "Toronto",
        "province": "Ontario",
        "postal": "M6K 1L4",
        "country": "Canada"
      }, {
        "name": "Oxtongue Craft Cabin & Gallery",
        "url": "oxtonguecraftcabin.com",
        "address": "1073 Fox Point Road",
        "city": "Dwight",
        "province": "Ontario",
        "postal": "P0A 1H0",
        "country": "Canada"
      }, {
        "name": "Cottage North",
        "url": "www.cottagenorthsoapworks.com",
        "address": "359 Main St.",
        "city": "Port Dover",
        "province": "Ontario",
        "postal": "N0A 1N0",
        "country": "Canada"
      }, {
        "name": "Timmins Museum Gift Shop",
        "url": "www.timminsmuseum.ca/gifts-from-everywhere-for-everyone/",
        "address": "325 Second Ave",
        "city": "Timmins",
        "province": "Ontario",
        "postal": "P4N 0B3",
        "country": "Canada"
      }, {
        "name": "Moose Lake Trading Post and Lodge",
        "url": "www.mooselakecottages.com/tradep.html",
        "address": "1870 Hwy 69",
        "city": "Pointe au Baril",
        "province": "Ontario",
        "postal": "P0G 1K0",
        "country": "Canada"
      }, {
        "name": "Hempware",
        "url": "www.hempwareonline.com",
        "address": "98 Duckworth st.",
        "city": "St. Johns",
        "province": "Newfoundland",
        "postal": "A1C 1E8",
        "country": "Canada"
      }, {
        "name": "Northern Sun Gallery",
        "url": "www.northernsungallery.com",
        "address": "8 Edgewater St.",
        "city": "Mahone Bay",
        "province": "Nova Scotia",
        "postal": "B0J 2E0",
        "country": "Canada"
      }, {
        "name": "Aphrodite",
        "url": "aphroditeartandfashion.com",
        "address": "292 Main Street",
        "city": "Antigonish",
        "province": "Nova Scotia",
        "postal": "B2G 2C4",
        "country": "Canada"
      }, {
        "name": "Moon Snail",
        "url": "www.ilovemoonsnail.com",
        "address": "85 Water Street",
        "city": "Charlottetown",
        "province": "Prince Edward Island",
        "postal": "C1A 1A5",
        "country": "Canada"
      }, {
        "name": "La Cour",
        "address": "166 a. rue Saint-Amable",
        "city": "Montreal",
        "province": "Quebec",
        "postal": "H2Y 1E8",
        "country": "Canada"
      }, {
        "name": "MacKenzie Art Gallery",
        "url": "www.mackenzieartgallery.sk.ca",
        "address": "3475 Albert St",
        "city": "Regina",
        "province": "Saskatchewan",
        "postal": "S4S 6X6",
        "country": "Canada"
      }
    ];
    $scope.countries = {};
    $scope.allProvinces = "Province";
    $scope.searchProvince = $scope.allProvinces;
    ref = $scope.locations;
    for (i = 0, len = ref.length; i < len; i++) {
      location = ref[i];
      country = (base = $scope.countries)[name = location.country] != null ? base[name] : base[name] = {};
      province = country[name1 = location.province] != null ? country[name1] : country[name1] = [];
      province.push(location);
    }
    $scope.searchProvinces = (function() {
      var results;
      results = [];
      for (province in $scope.countries["Canada"]) {
        results.push(province);
      }
      return results;
    })();
    $scope.searchProvinces = $scope.searchProvinces.sort();
    $scope.searchProvinces.unshift($scope.allProvinces);
    return $scope.showProvince = function(input) {
      switch ($scope.searchProvince) {
        case $scope.allProvinces:
          return true;
        case input:
          return true;
        default:
          return false;
      }
    };
  });

  angular.module("Shop", []).controller("ShopCtrl", function($scope) {
    var currentVariations;
    $scope.products = [
      {
        variations: [
          {
            hero: "assets/raw-ring.jpg"
          }, {
            hero: "assets/coffee-and-crystals-green-turquoise.jpg"
          }
        ]
      }, {
        variations: [
          {
            hero: "assets/coffee-and-crystals-green-turquoise.jpg"
          }
        ]
      }
    ];
    currentVariations = [0, 0];
    return $scope.getVariation = function(productIndex, offset) {
      var nVariations, product, realIndex, variationIndex;
      product = $scope.products[productIndex];
      nVariations = product.variations.length;
      variationIndex = currentVariations[productIndex] + offset;
      realIndex = (variationIndex + nVariations) % nVariations;
      return $scope.products[productIndex].variations[realIndex];
    };
  });

  angular.module("Wholesale", []).controller("WholesaleCtrl", function($scope) {
    return $scope.products = [
      {
        image: "assets/bark-a.png"
      }, {
        image: "assets/wrap-cuff-green.jpg"
      }, {
        image: "assets/wrap-cuff-pink.jpg"
      }, {
        image: "assets/wrap-cuff-pumpkin.jpg"
      }, {
        image: "assets/wrap-cuff-slate.png"
      }, {
        image: "assets/wrap-cuff-turq.jpg"
      }, {
        image: "assets/wrap-cuff-orangesicle.jpg"
      }, {
        image: "assets/wrap-cuff-violet.jpg"
      }, {
        image: "assets/bark-a.png"
      }, {
        image: "assets/wrap-cuff-green.jpg"
      }, {
        image: "assets/wrap-cuff-pink.jpg"
      }, {
        image: "assets/wrap-cuff-pumpkin.jpg"
      }, {
        image: "assets/wrap-cuff-slate.png"
      }, {
        image: "assets/wrap-cuff-turq.jpg"
      }, {
        image: "assets/wrap-cuff-orangesicle.jpg"
      }, {
        image: "assets/wrap-cuff-violet.jpg"
      }, {
        image: "assets/bark-a.png"
      }, {
        image: "assets/wrap-cuff-green.jpg"
      }, {
        image: "assets/wrap-cuff-pink.jpg"
      }, {
        image: "assets/wrap-cuff-pumpkin.jpg"
      }, {
        image: "assets/wrap-cuff-slate.png"
      }, {
        image: "assets/wrap-cuff-turq.jpg"
      }, {
        image: "assets/wrap-cuff-orangesicle.jpg"
      }, {
        image: "assets/wrap-cuff-violet.jpg"
      }, {
        image: "assets/bark-a.png"
      }, {
        image: "assets/wrap-cuff-green.jpg"
      }, {
        image: "assets/wrap-cuff-pink.jpg"
      }, {
        image: "assets/wrap-cuff-pumpkin.jpg"
      }, {
        image: "assets/wrap-cuff-slate.png"
      }, {
        image: "assets/wrap-cuff-turq.jpg"
      }
    ];
  });

}).call(this);
