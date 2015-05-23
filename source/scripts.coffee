# @codekit-append "scripts/page-style.coffee"
# @codekit-append "scripts/routes.coffee"

# @codekit-append "pages/about.coffee"
# @codekit-append "pages/events.coffee"
# @codekit-append "pages/locations.coffee"
# @codekit-append "pages/shop.coffee"
# @codekit-append "pages/wholesale.coffee"

angular.module "FehuApp", [
   # Libs
   "ngRoute"
   "ngTouch"
   
   # Pages
   "About"
   "Locations"
   "Shop"
   "Wholesale"
   
   # Scripts
   "PageStyle"
   "Routes"
]
