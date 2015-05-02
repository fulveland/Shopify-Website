# @codekit-append "scripts/page-style.coffee"
# @codekit-append "scripts/routes.coffee"

# @codekit-append "pages/about.coffee"
# @codekit-append "pages/events.coffee"
# @codekit-append "pages/locations.coffee"
# @codekit-append "pages/shop.coffee"
# @codekit-append "pages/wholesale.coffee"

# @codekit-append "/components/tot-cat.coffee"
# @codekit-append "/components/tot-hero.coffee"
# @codekit-append "/components/tot-info.coffee"

angular.module "FehuApp", [
   # Libraries
   "ngRoute"
   "ngTouch"
   
   # Config
   "Routes"
   
   # Directives
   "PageStyle"
   
   # Components
   "TotCat"
   "TotHero"
   "TotInfo"
   
   # Pages
   "About"
   "Locations"
   "Shop"
   "Wholesale"
]
