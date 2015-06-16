// Generated by CoffeeScript 1.9.2
(function() {
  var StubProducts;

  angular.module("FehuApp", ["ngRoute", "ngTouch", "ProductInfo", "VariationContainer", "About", "Locations", "Shop", "Wholesale", "Ease", "PageStyle", "Products", "PureMath", "Routes", "ScrollAnimation", "StubProducts"]);

  angular.module("ProductInfo", []).directive("productInfo", function() {
    return {
      templateUrl: "product-info.html",
      controller: function() {
        return "cool";
      }
    };
  });

  angular.module("VariationContainer", []).directive("variationContainer", function($swipe, $timeout, Ease, ScrollAnimation) {
    return {
      templateUrl: "variation-container.html",
      link: function(scope, element, attrs) {
        var A, B, C, apply, applyOpacity, applyTranslate, child, dragStart, enableTransition, handlers, i, len, productIndex, ref, size, slider, updateOffsets, updateSize;
        productIndex = scope.$index;
        slider = element.children().children();
        A = B = C = null;
        size = null;
        dragStart = 0;
        scope.offsetA = 0;
        scope.offsetB = 0;
        scope.offsetC = 0;
        scope.offset = 0;
        ref = slider.children();
        for (i = 0, len = ref.length; i < len; i++) {
          child = ref[i];
          switch (child.className) {
            case "variation A":
              A = child;
              break;
            case "variation B":
              B = child;
              break;
            case "variation C":
              C = child;
          }
        }
        updateOffsets = function(delta) {
          scope.offset += delta;
          scope.offsetA = Math.floor((-scope.offset + 2) / 3) * 3;
          scope.offsetB = Math.floor((-scope.offset + 1) / 3) * 3;
          scope.offsetC = Math.floor((-scope.offset + 0) / 3) * 3;
          return scope.changeVariation(productIndex, scope.offset);
        };
        updateSize = function() {
          return size = slider[0].offsetHeight;
        };
        enableTransition = function(enable) {
          A.style.transition = (enable ? "opacity .5s cubic-bezier(.16,.56,.5,1)" : null);
          B.style.transition = (enable ? "opacity .5s cubic-bezier(.16,.56,.5,1)" : null);
          C.style.transition = (enable ? "opacity .5s cubic-bezier(.16,.56,.5,1)" : null);
          slider.css("-webkit-transition", (enable ? "-webkit-transform .5s cubic-bezier(.16,.56,.5,1)" : null));
          slider.css("-moz-transition", (enable ? "-moz-transform .5s cubic-bezier(.16,.56,.5,1)" : null));
          slider.css("-ms-transition", (enable ? "-ms-transform .5s cubic-bezier(.16,.56,.5,1)" : null));
          return slider.css("transition", (enable ? "transform .5s cubic-bezier(.16,.56,.5,1)" : null));
        };
        applyTranslate = function(x) {
          x += scope.offset * size;
          slider.css("transform", "translateX(" + x + "px)");
          slider.css("-ms-transform", "translateX(" + x + "px)");
          slider.css("-webkit-transform", "translateX(" + x + "px)");
          A.style["-webkit-transform"] = "translateX(" + (scope.offsetA * size) + "px)";
          B.style["-webkit-transform"] = "translateX(" + (scope.offsetB * size) + "px)";
          return C.style["-webkit-transform"] = "translateX(" + (scope.offsetC * size) + "px)";
        };
        applyOpacity = function(v) {
          v += scope.offset;
          A.style.opacity = 1 - Math.abs((v + scope.offsetA - 1) / 1.25);
          B.style.opacity = 1 - Math.abs((v + scope.offsetB) / 1.25);
          return C.style.opacity = 1 - Math.abs((v + scope.offsetC + 1) / 1.25);
        };
        apply = function(x) {
          applyTranslate(x);
          return applyOpacity(x / size);
        };
        handlers = {
          start: function(pos, event) {
            dragStart = pos.x;
            updateSize();
            return enableTransition(false);
          },
          move: function(pos) {
            var x;
            x = pos.x - dragStart;
            return apply(x);
          },
          end: function(pos) {
            var x;
            x = pos.x - dragStart;
            enableTransition(true);
            if (Math.abs(x) > size / 5) {
              if (x < 0) {
                updateOffsets(-1);
              } else {
                updateOffsets(1);
              }
            }
            return scope.$apply(function() {
              return apply(0);
            });
          }
        };
        $swipe.bind(slider, handlers, ["touch"]);
        scope.clickAction = function(shift) {
          var endScroll, rect;
          if (shift > 0) {
            updateSize();
            enableTransition(true);
            updateOffsets(-1);
            return apply(0);
          } else if (shift < 0) {
            updateSize();
            enableTransition(true);
            updateOffsets(1);
            return apply(0);
          } else {
            scope.showProductInfo = !scope.showProductInfo;
            if (scope.showProductInfo) {
              rect = element[0].getBoundingClientRect();
              endScroll = rect.bottom + document.body.scrollTop - rect.height / 4;
              return ScrollAnimation.animate(endScroll);
            }
          }
        };
        return scope.getClass = function(shift) {
          if (shift > 0) {
            return "next";
          } else if (shift < 0) {
            return "prev";
          } else {
            return "current";
          }
        };
      }
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

  angular.module("Shop", []).controller("ShopCtrl", function(Products, $scope) {
    var product;
    $scope.showProductInfo = false;
    $scope.products = Products.all();
    $scope.currentVariations = (function() {
      var i, len, ref, results;
      ref = $scope.products;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        product = ref[i];
        results.push(0);
      }
      return results;
    })();
    $scope.changeVariation = function(productIndex, change) {
      return $scope.currentVariations[productIndex] += change;
    };
    return $scope.getVariation = function(productIndex, variationIndex) {
      var nVariations, realIndex;
      product = $scope.products[productIndex];
      nVariations = product.variations.length;
      realIndex = (variationIndex + nVariations) % nVariations;
      return $scope.products[productIndex].variations[realIndex];
    };
  });

  angular.module("Wholesale", []).controller("WholesaleCtrl", function($scope) {
    return $scope.products = [
      {
        image: "assets/wrap-cuff-bark-a.png"
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
        image: "assets/wrap-cuff-bark-a.png"
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
        image: "assets/wrap-cuff-bark-a.png"
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
        image: "assets/wrap-cuff-bark-a.png"
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

  angular.module("Ease", []).service("Ease", function(PureMath) {
    var Ease;
    return Ease = {
      linear: function(input, inputMin, inputMax, outputMin, outputMax, clip) {
        if (inputMin == null) {
          inputMin = 0;
        }
        if (inputMax == null) {
          inputMax = 1;
        }
        if (outputMin == null) {
          outputMin = 0;
        }
        if (outputMax == null) {
          outputMax = 1;
        }
        if (clip == null) {
          clip = true;
        }
        if (inputMin === inputMax) {
          return outputMin;
        }
        if (clip) {
          input = PureMath.clip(input, inputMin, inputMax);
        }
        input -= inputMin;
        input /= inputMax - inputMin;
        input *= outputMax - outputMin;
        input += outputMin;
        return input;
      },
      cubic: function(input, inputMin, inputMax, outputMin, outputMax, clip) {
        if (inputMin == null) {
          inputMin = 0;
        }
        if (inputMax == null) {
          inputMax = 1;
        }
        if (outputMin == null) {
          outputMin = 0;
        }
        if (outputMax == null) {
          outputMax = 1;
        }
        if (clip == null) {
          clip = true;
        }
        return Ease.power(input, 3, inputMin, inputMax, outputMin, outputMax, clip);
      },
      power: function(input, power, inputMin, inputMax, outputMin, outputMax, clip) {
        var inputDiff, outputDiff, p;
        if (power == null) {
          power = 1;
        }
        if (inputMin == null) {
          inputMin = 0;
        }
        if (inputMax == null) {
          inputMax = 1;
        }
        if (outputMin == null) {
          outputMin = 0;
        }
        if (outputMax == null) {
          outputMax = 1;
        }
        if (clip == null) {
          clip = true;
        }
        if (inputMin === inputMax) {
          return outputMin;
        }
        if (clip) {
          input = PureMath.clip(input, inputMin, inputMax);
        }
        outputDiff = outputMax - outputMin;
        inputDiff = inputMax - inputMin;
        p = (input - inputMin) / (inputDiff / 2);
        if (p < 1) {
          return outputMin + outputDiff / 2 * Math.pow(p, power);
        } else {
          return outputMin + outputDiff / 2 * (2 - Math.abs(Math.pow(p - 2, power)));
        }
      }
    };
  });

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

  angular.module("Products", []).service("Products", function(StubProducts) {
    var Products;
    return Products = {
      all: function() {
        return StubProducts;
      }
    };
  });

  angular.module("PureMath", []).service("PureMath", function() {
    var PureMath;
    return PureMath = {
      clip: function(input, min, max) {
        if (min == null) {
          min = 0;
        }
        if (max == null) {
          max = 1;
        }
        if (input < min) {
          return min;
        }
        if (input > max) {
          return max;
        }
        return input;
      }
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

  angular.module("ScrollAnimation", []).service("ScrollAnimation", function() {
    var ScrollAnimation, animateFn;
    animateFn = null;
    return ScrollAnimation = {
      register: function(a) {
        return animateFn = a;
      },
      animate: function(endScroll) {
        if (animateFn != null) {
          return animateFn(endScroll);
        }
      }
    };
  }).directive("scrollAnimation", function(Ease, ScrollAnimation) {
    return {
      controller: function($element) {
        var SCROLL_ANIMATION_SPEED, THRESHOLD, animateFn, endScroll, endTime, firstTick, startScroll, startTime, subject, tick;
        THRESHOLD = 50;
        SCROLL_ANIMATION_SPEED = 500;
        startTime = endTime = startScroll = endScroll = null;
        subject = $element[0];
        tick = function(currentTime) {
          subject.scrollTop = Ease.cubic(currentTime, startTime, endTime, startScroll, endScroll, true);
          if (currentTime < endTime) {
            return requestAnimationFrame(tick);
          }
        };
        firstTick = function(currentTime) {
          var duration;
          startTime = currentTime;
          duration = Math.sqrt(Math.abs((endScroll - startScroll) * SCROLL_ANIMATION_SPEED));
          endTime = startTime + duration;
          return tick(currentTime);
        };
        animateFn = function(eS) {
          startScroll = subject.scrollTop;
          endScroll = eS;
          if (Math.abs(startScroll - endScroll) > THRESHOLD) {
            return requestAnimationFrame(firstTick);
          }
        };
        return ScrollAnimation.register(animateFn);
      }
    };
  });

  angular.module("StubProducts", []).constant("StubProducts", StubProducts = [
    {
      variations: [
        {
          hero: "assets/raw-ring.jpg"
        }
      ]
    }, {
      variations: [
        {
          hero: "assets/coffee-and-crystals-howlite.jpg"
        }, {
          hero: "assets/coffee-and-crystals-pyrite.jpg"
        }, {
          hero: "assets/coffee-and-crystals-green-turquoise.jpg"
        }, {
          hero: "assets/coffee-and-crystals-light-turquoise.jpg"
        }, {
          hero: "assets/coffee-and-crystals-malachite.jpg"
        }, {
          hero: "assets/coffee-and-crystals-lapis.jpg"
        }, {
          hero: "assets/coffee-and-crystals-jasper.jpg"
        }, {
          hero: "assets/coffee-and-crystals-smokey-quartz.jpg"
        }, {
          hero: "assets/coffee-and-crystals-goldstone.jpg"
        }
      ]
    }, {
      variations: [
        {
          hero: "assets/fuzzy-cuff-1.jpg"
        }, {
          hero: "assets/fuzzy-cuff-2.jpg"
        }, {
          hero: "assets/fuzzy-cuff-3.jpg"
        }, {
          hero: "assets/fuzzy-cuff-4.jpg"
        }, {
          hero: "assets/fuzzy-cuff-5.jpg"
        }, {
          hero: "assets/fuzzy-cuff-6.jpg"
        }, {
          hero: "assets/fuzzy-cuff-7.jpg"
        }, {
          hero: "assets/fuzzy-cuff-8.jpg"
        }, {
          hero: "assets/fuzzy-cuff-9.jpg"
        }, {
          hero: "assets/fuzzy-cuff-10.jpg"
        }, {
          hero: "assets/fuzzy-cuff-11.jpg"
        }, {
          hero: "assets/fuzzy-cuff-12.jpg"
        }
      ]
    }
  ]);

}).call(this);
