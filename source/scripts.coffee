# @codekit-append "components/product-info.coffee"

# @codekit-append "pages/about.coffee"
# @codekit-append "pages/events.coffee"
# @codekit-append "pages/locations.coffee"
# @codekit-append "pages/shop.coffee"
# @codekit-append "pages/wholesale.coffee"

# @codekit-append "scripts/ease.coffee"
# @codekit-append "scripts/page-style.coffee"
# @codekit-append "scripts/products.coffee"
# @codekit-append "scripts/pure-math.coffee"
# @codekit-append "scripts/routes.coffee"
# @codekit-append "scripts/scroll-animation.coffee"
# @codekit-append "scripts/scroll-jack.coffee"
# @codekit-append "scripts/stub-products.coffee"

angular.module "FehuApp", [
   # Libs
   "ngRoute"
   "ngTouch"
   
   # Components
   "ProductInfo"
   
   # Pages
   "About"
   "Locations"
   "Shop"
   "Wholesale"
   
   # Scripts
   "Ease"
   "PageStyle"
   "Products"
   "PureMath"
   "Routes"
   "ScrollAnimation"
   "ScrollJack"
   "StubProducts"
]
