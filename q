[1mdiff --git a/FlashCards/App/cards/index.html b/FlashCards/App/cards/index.html[m
[1mindex 4754034..fc4e5fe 100644[m
[1m--- a/FlashCards/App/cards/index.html[m
[1m+++ b/FlashCards/App/cards/index.html[m
[36m@@ -2,9 +2,9 @@[m
    [m
    <div data-bind="visible: selected.found === true">[m
       <div class="row">[m
[31m-         <button class="col-xs-4 col-sm-2 col-md-1 btn btn-default" [m
[32m+[m[32m         <button class="col-xs-4 col-sm-2 col-lg-1 btn btn-default"[m[41m [m
                  data-bind="enable: selected.hasPrevious, click: previous">Previous</button>[m
[31m-         <button class="col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10 btn btn-default" [m
[32m+[m[32m         <button class="col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-8 col-lg-1 col-lg-offset-10 btn btn-default"[m[41m [m
                  data-bind="enable: selected.hasNext, click: next">Next</button>[m
       </div>[m
       [m
[1mdiff --git a/FlashCards/AppBuilt/main.js b/FlashCards/AppBuilt/main.js[m
[1mindex f88c4db..a4e9c0c 100644[m
[1m--- a/FlashCards/AppBuilt/main.js[m
[1m+++ b/FlashCards/AppBuilt/main.js[m
[36m@@ -441,7 +441,7 @@[m [mdefine('services/flashCardService',["durandal/system","mockData/multiplication",[m
 define('models/random',["durandal/system"],function(e){var n=function(n){var s=t(0,n.length-1);return e.log("Random Index: "+s),s},t=function(e,n){return Math.floor(Math.random()*(n-e+1))+e};return{pickRandom:n,randomBetween:t}});[m
 define('models/selectedCards',["durandal/app","durandal/system","plugins/observable","services/flashCardService","models/random"],function(e,n,t,s,a){var i={name:"",cards:[],card:{},index:0,found:!1,random:!1};return e.on("randomChanged").then(function(e){n.log("Random changed: "+e),i.random=e}),i.select=function(e){return s.getCards(e).done(function(n){i.found=!0,i.cards=n,i.name=e,i.index=0,i.card=i.cards[0]}).fail(function(){i.found=!1})},i.setIndex=function(e){return e=parseInt(e),0>e||e>i.cards.length-1?(i.found=!1,void 0):(i.index=e,i.card=i.cards[e],void 0)},i.nextIndex=function(){return i.random?a.pickRandom(i.cards):i.index<i.cards.length-1?i.index+1:i.cards.length-1},i.previousIndex=function(){return i.index<1?0:i.index-1},t.defineProperty(i,"hasNext",function(){return i.random?!0:i.index<i.cards.length-1}),t.defineProperty(i,"hasPrevious",function(){return i.random?!1:i.index>0}),t.defineProperty(i,"selectedOf",function(){return i.cards&&0!==i.cards.length?i.index+1+" of "+i.cards.length:""}),t.convertObject(i),i});[m
 define('cards/card',["models/selectedCards"],function(e){var t={},n=0;return t.selected=e,t.activate=function(e,t){n=t},t.attached=function(){e.setIndex(n)},t.flip=function(){$(".card").toggleClass("flip")},t});[m
[31m-define('text!cards/index.html',[],function () { return '<div class="col-xs-offset-1 col-xs-10">\r\n   \r\n   <div data-bind="visible: selected.found === true">\r\n      <div class="row">\r\n         <button class="col-xs-4 col-sm-2 col-md-1 btn btn-default" \r\n                 data-bind="enable: selected.hasPrevious, click: previous">Previous</button>\r\n         <button class="col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-8 col-md-1 col-md-offset-10 btn btn-default" \r\n                 data-bind="enable: selected.hasNext, click: next">Next</button>\r\n      </div>\r\n      \r\n      <div class="row status">\r\n         <span data-bind="text: selected.selectedOf"/>\r\n         <span class="selectedName" data-bind="text: selected.name"></span>\r\n      </div>\r\n\r\n      <div class="row" data-bind="router: { transition:\'entrance\'}"></div>\r\n      \r\n   </div>\r\n\r\n   <div data-bind="visible: selected.found === false">\r\n      <h2>Card not found.</h2>\r\n   </div>\r\n\r\n</div>\r\n';});[m
[32m+[m[32mdefine('text!cards/index.html',[],function () { return '<div class="col-xs-offset-1 col-xs-10">\r\n   \r\n   <div data-bind="visible: selected.found === true">\r\n      <div class="row">\r\n         <button class="col-xs-4 col-sm-2 col-lg-1 btn btn-default" \r\n                 data-bind="enable: selected.hasPrevious, click: previous">Previous</button>\r\n         <button class="col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-8 col-lg-1 col-lg-offset-10 btn btn-default" \r\n                 data-bind="enable: selected.hasNext, click: next">Next</button>\r\n      </div>\r\n      \r\n      <div class="row status">\r\n         <span data-bind="text: selected.selectedOf"/>\r\n         <span class="selectedName" data-bind="text: selected.name"></span>\r\n      </div>\r\n\r\n      <div class="row" data-bind="router: { transition:\'entrance\'}"></div>\r\n      \r\n   </div>\r\n\r\n   <div data-bind="visible: selected.found === false">\r\n      <h2>Card not found.</h2>\r\n   </div>\r\n\r\n</div>\r\n';});[m
 [m
 define('plugins/history',["durandal/system","jquery"],function(e,t){function n(e,t,n){if(n){var i=e.href.replace(/(javascript:|#).*$/,"");e.replace(i+"#"+t)}else e.hash="#"+t}var i=/^[#\/]|\s+$/g,a=/^\/+|\/+$/g,r=/msie [\w.]+/,o=/\/$/,s={interval:50,active:!1};return"undefined"!=typeof window&&(s.location=window.location,s.history=window.history),s.getHash=function(e){var t=(e||s).location.href.match(/#(.*)$/);return t?t[1]:""},s.getFragment=function(e,t){if(null==e)if(s._hasPushState||!s._wantsHashChange||t){e=s.location.pathname+s.location.search;var n=s.root.replace(o,"");e.indexOf(n)||(e=e.substr(n.length))}else e=s.getHash();return e.replace(i,"")},s.activate=function(n){s.active&&e.error("History has already been activated."),s.active=!0,s.options=e.extend({},{root:"/"},s.options,n),s.root=s.options.root,s._wantsHashChange=s.options.hashChange!==!1,s._wantsPushState=!!s.options.pushState,s._hasPushState=!!(s.options.pushState&&s.history&&s.history.pushState);var o=s.getFragment(),c=document.documentMode,u=r.exec(navigator.userAgent.toLowerCase())&&(!c||7>=c);s.root=("/"+s.root+"/").replace(a,"/"),u&&s._wantsHashChange&&(s.iframe=t('<iframe src="javascript:0" tabindex="-1" />').hide().appendTo("body")[0].contentWindow,s.navigate(o,!1)),s._hasPushState?t(window).on("popstate",s.checkUrl):s._wantsHashChange&&"onhashchange"in window&&!u?t(window).on("hashchange",s.checkUrl):s._wantsHashChange&&(s._checkUrlInterval=setInterval(s.checkUrl,s.interval)),s.fragment=o;var l=s.location,d=l.pathname.replace(/[^\/]$/,"$&/")===s.root;if(s._wantsHashChange&&s._wantsPushState){if(!s._hasPushState&&!d)return s.fragment=s.getFragment(null,!0),s.location.replace(s.root+s.location.search+"#"+s.fragment),!0;s._hasPushState&&d&&l.hash&&(this.fragment=s.getHash().replace(i,""),this.history.replaceState({},document.title,s.root+s.fragment+l.search))}return s.options.silent?void 0:s.loadUrl()},s.deactivate=function(){t(window).off("popstate",s.checkUrl).off("hashchange",s.checkUrl),clearInterval(s._checkUrlInterval),s.active=!1},s.checkUrl=function(){var e=s.getFragment();return e===s.fragment&&s.iframe&&(e=s.getFragment(s.getHash(s.iframe))),e===s.fragment?!1:(s.iframe&&s.navigate(e,!1),s.loadUrl(),void 0)},s.loadUrl=function(e){var t=s.fragment=s.getFragment(e);return s.options.routeHandler?s.options.routeHandler(t):!1},s.navigate=function(t,i){if(!s.active)return!1;if(void 0===i?i={trigger:!0}:e.isBoolean(i)&&(i={trigger:i}),t=s.getFragment(t||""),s.fragment!==t){s.fragment=t;var a=s.root+t;if(""===t&&"/"!==a&&(a=a.slice(0,-1)),s._hasPushState)s.history[i.replace?"replaceState":"pushState"]({},document.title,a);else{if(!s._wantsHashChange)return s.location.assign(a);n(s.location,t,i.replace),s.iframe&&t!==s.getFragment(s.getHash(s.iframe))&&(i.replace||s.iframe.document.open().close(),n(s.iframe.location,t,i.replace))}return i.trigger?s.loadUrl(t):void 0}},s.navigateBack=function(){s.history.back()},s});[m
 define('plugins/router',["durandal/system","durandal/app","durandal/activator","durandal/events","durandal/composition","plugins/history","knockout","jquery"],function(e,t,n,i,r,a,o,s){function u(e){return e=e.replace(h,"\\$&").replace(g,"(?:$1)?").replace(p,function(e,t){return t?e:"([^/]+)"}).replace(w,"(.*?)"),new RegExp("^"+e+"$")}function c(e){var t=e.indexOf(":"),n=t>0?t-1:e.length;return e.substring(0,n)}function l(e,t){return-1!==e.indexOf(t,e.length-t.length)}function d(e,t){if(!e||!t)return!1;if(e.length!=t.length)return!1;for(var n=0,i=e.length;i>n;n++)if(e[n]!=t[n])return!1;return!0}var f,v,g=/\((.*?)\)/g,p=/(\(\?)?:\w+/g,w=/\*\w+/g,h=/[\-{}\[\]+?.,\\\^$|#\s]/g,m=/\/$/,A=function(){function r(e){return e.router&&e.router.parent==R}function s(e){_&&_.config.isActive&&_.config.isActive(e)}function g(t,n){e.log("Navigation Complete",t,n);var i=e.getModuleId(k);i&&R.trigger("router:navigation:from:"+i),k=t,s(!1),_=n,s(!0);var a=e.getModuleId(k);a&&R.trigger("router:navigation:to:"+a),r(t)||R.updateDocumentTitle(t,n),v.explicitNavigation=!1,v.navigatingBack=!1,R.trigger("router:navigation:complete",t,n,R)}function p(t,n){e.log("Navigation Cancelled"),R.activeInstruction(_),_&&R.navigate(_.fragment,!1),N(!1),v.explicitNavigation=!1,v.navigatingBack=!1,R.trigger("router:navigation:cancelled",t,n,R)}function w(t){e.log("Navigation Redirecting"),N(!1),v.explicitNavigation=!1,v.navigatingBack=!1,R.navigate(t,{trigger:!0,replace:!0})}function h(t,n,i){v.navigatingBack=!v.explicitNavigation&&k!=i.fragment,R.trigger("router:route:activating",n,i,R),t.activateItem(n,i.params).then(function(e){if(e){var a=k;if(g(n,i),r(n)){var o=i.fragment;i.queryString&&(o+="?"+i.queryString),n.router.loadUrl(o)}a==n&&(R.attached(),R.compositionComplete())}else t.settings.lifecycleData&&t.settings.lifecycleData.redirect?w(t.settings.lifecycleData.redirect):p(n,i);f&&(f.resolve(),f=null)}).fail(function(t){e.error(t)})}function y(t,n,i){var r=R.guardRoute(n,i);r?r.then?r.then(function(r){r?e.isString(r)?w(r):h(t,n,i):p(n,i)}):e.isString(r)?w(r):h(t,n,i):p(n,i)}function b(e,t,n){R.guardRoute?y(e,t,n):h(e,t,n)}function S(e){return _&&_.config.moduleId==e.config.moduleId&&k&&(k.canReuseForRoute&&k.canReuseForRoute.apply(k,e.params)||!k.canReuseForRoute&&k.router&&k.router.loadUrl)}function Q(){if(!N()){var t=D.shift();D=[],t&&(N(!0),R.activeInstruction(t),S(t)?b(n.create(),k,t):e.acquire(t.config.moduleId).then(function(n){var i=e.resolveObject(n);b(O,i,t)}).fail(function(n){e.error("Failed to load routed module ("+t.config.moduleId+"). Details: "+n.message)}))}}function C(e){D.unshift(e),Q()}function X(e,t,n){for(var i=e.exec(t).slice(1),r=0;r<i.length;r++){var a=i[r];i[r]=a?decodeURIComponent(a):null}var o=R.parseQueryString(n);return o&&i.push(o),{params:i,queryParams:o}}function x(t){R.trigger("router:route:before-config",t,R),e.isRegExp(t)?t.routePattern=t.route:(t.title=t.title||R.convertRouteToTitle(t.route),t.moduleId=t.moduleId||R.convertRouteToModuleId(t.route),t.hash=t.hash||R.convertRouteToHash(t.route),t.routePattern=u(t.route)),t.isActive=t.isActive||o.observable(!1),R.trigger("router:route:after-config",t,R),R.routes.push(t),R.route(t.routePattern,function(e,n){var i=X(t.routePattern,e,n);C({fragment:e,queryString:n,config:t,params:i.params,queryParams:i.queryParams})})}function I(t){if(e.isArray(t.route))for(var n=t.isActive||o.observable(!1),i=0,r=t.route.length;r>i;i++){var a=e.extend({},t);a.route=t.route[i],a.isActive=n,i>0&&delete a.nav,x(a)}else x(t);return R}var k,_,D=[],N=o.observable(!1),O=n.create(),R={handlers:[],routes:[],navigationModel:o.observableArray([]),activeItem:O,isNavigating:o.computed(function(){var e=O(),t=N(),n=e&&e.router&&e.router!=R&&e.router.isNavigating()?!0:!1;return t||n}),activeInstruction:o.observable(null),__router__:!0};return i.includeIn(R),O.settings.areSameItem=function(e,t,n,i){return e==t?d(n,i):!1},R.parseQueryString=function(e){var t,n;if(!e)return null;if(n=e.split("&"),0==n.length)return null;t={};for(var i=0;i<n.length;i++){var r=n[i];if(""!==r){var a=r.split("=");t[a[0]]=a[1]&&decodeURIComponent(a[1].replace(/\+/g," "))}}return t},R.route=function(e,t){R.handlers.push({routePattern:e,callback:t})},R.loadUrl=function(t){var n=R.handlers,i=null,r=t,o=t.indexOf("?");if(-1!=o&&(r=t.substring(0,o),i=t.substr(o+1)),R.relativeToParentRouter){var s=this.parent.activeInstruction();r=s.params.join("/"),r&&"/"==r.charAt(0)&&(r=r.substr(1)),r||(r=""),r=r.replace("//","/").replace("//","/")}r=r.replace(m,"");for(var u=0;u<n.length;u++){var c=n[u];if(c.routePattern.test(r))return c.callback(r,i),!0}return e.log("Route Not Found"),R.trigger("router:route:not-found",t,R),_&&a.navigate(_.fragment,{trigger:!1,replace:!0}),v.explicitNavigation=!1,v.navigatingBack=!1,!1},R.updateDocumentTitle=function(e,n){n.config.title?document.title=t.title?n.config.title+" | "+t.title:n.config.title:t.title&&(document.title=t.title)},R.navigate=function(e,t){return e&&-1!=e.indexOf("://")?(window.location.href=e,!0):(v.explicitNavigation=!0,a.navigate(e,t))},R.navigateBack=function(){a.navigateBack()},R.attached=function(){R.trigger("router:navigation:attached",k,_,R)},R.compositionComplete=function(){N(!1),R.trigger("router:navigation:composition-complete",k,_,R),Q()},R.convertRouteToHash=function(e){if(R.relativeToParentRouter){var t=R.parent.activeInstruction(),n=t.config.hash+"/"+e;return a._hasPushState&&(n="/"+n),n=n.replace("//","/").replace("//","/")}return a._hasPushState?e:"#"+e},R.convertRouteToModuleId=function(e){return c(e)},R.convertRouteToTitle=function(e){var t=c(e);return t.substring(0,1).toUpperCase()+t.substring(1)},R.map=function(t,n){if(e.isArray(t)){for(var i=0;i<t.length;i++)R.map(t[i]);return R}return e.isString(t)||e.isRegExp(t)?(n?e.isString(n)&&(n={moduleId:n}):n={},n.route=t):n=t,I(n)},R.buildNavigationModel=function(t){for(var n=[],i=R.routes,r=t||100,a=0;a<i.length;a++){var o=i[a];o.nav&&(e.isNumber(o.nav)||(o.nav=++r),n.push(o))}return n.sort(function(e,t){return e.nav-t.nav}),R.navigationModel(n),R},R.mapUnknownRoutes=function(t,n){var i="*catchall",r=u(i);return R.route(r,function(o,s){var u=X(r,o,s),c={fragment:o,queryString:s,config:{route:i,routePattern:r},params:u.params,queryParams:u.queryParams};if(t)if(e.isString(t))c.config.moduleId=t,n&&a.navigate(n,{trigger:!1,replace:!0});else if(e.isFunction(t)){var l=t(c);if(l&&l.then)return l.then(function(){R.trigger("router:route:before-config",c.config,R),R.trigger("router:route:after-config",c.config,R),C(c)}),void 0}else c.config=t,c.config.route=i,c.config.routePattern=r;else c.config.moduleId=o;R.trigger("router:route:before-config",c.config,R),R.trigger("router:route:after-config",c.config,R),C(c)}),R},R.reset=function(){return _=k=void 0,R.handlers=[],R.routes=[],R.off(),delete R.options,R},R.makeRelative=function(t){return e.isString(t)&&(t={moduleId:t,route:t}),t.moduleId&&!l(t.moduleId,"/")&&(t.moduleId+="/"),t.route&&!l(t.route,"/")&&(t.route+="/"),t.fromParent&&(R.relativeToParentRouter=!0),R.on("router:route:before-config").then(function(e){t.moduleId&&(e.moduleId=t.moduleId+e.moduleId),t.route&&(e.route=""===e.route?t.route.substring(0,t.route.length-1):t.route+e.route)}),R},R.createChildRouter=function(){var e=A();return e.parent=R,e},R};return v=A(),v.explicitNavigation=!1,v.navigatingBack=!1,v.targetIsThisWindow=function(e){var t=s(e.target).attr("target");return!t||t===window.name||"_self"===t||"top"===t&&window===window.top?!0:!1},v.activate=function(t){return e.defer(function(n){if(f=n,v.options=e.extend({routeHandler:v.loadUrl},v.options,t),a.activate(v.options),a._hasPushState)for(var i=v.routes,r=i.length;r--;){var o=i[r];o.hash=o.hash.replace("#","")}s(document).delegate("a","click",function(e){if(a._hasPushState){if(!e.altKey&&!e.ctrlKey&&!e.metaKey&&!e.shiftKey&&v.targetIsThisWindow(e)){var t=s(this).attr("href");null==t||"#"===t.charAt(0)||/^[a-z]+:/i.test(t)||(v.explicitNavigation=!0,e.preventDefault(),a.navigate(t))}}else v.explicitNavigation=!0}),a.options.silent&&f&&(f.resolve(),f=null)}).promise()},v.deactivate=function(){a.deactivate()},v.install=function(){o.bindingHandlers.router={init:function(){return{controlsDescendantBindings:!0}},update:function(e,t,n,i,a){var s=o.utils.unwrapObservable(t())||{};if(s.__router__)s={model:s.activeItem(),attached:s.attached,compositionComplete:s.compositionComplete,activate:!1};else{var u=o.utils.unwrapObservable(s.router||i.router)||v;s.model=u.activeItem(),s.attached=u.attached,s.compositionComplete=u.compositionComplete,s.activate=!1}r.compose(e,s,a)}},o.virtualElements.allowedBindings.router=!0},v});[m
[1mdiff --git a/FlashCards/FlashCards.csproj b/FlashCards/FlashCards.csproj[m
[1mindex 999a85e..5d79c9d 100644[m
[1m--- a/FlashCards/FlashCards.csproj[m
[1m+++ b/FlashCards/FlashCards.csproj[m
[36m@@ -162,9 +162,13 @@[m
     <Content Include="Content\font-awesome.css" />[m
     <Content Include="Content\font-awesome.min.css" />[m
     <Content Include="Content\ie10mobile.css" />[m
[31m-    <Content Include="Content\images\icon.png" />[m
[31m-    <Content Include="Content\images\ios-startup-image-landscape.png" />[m
[31m-    <Content Include="Content\images\ios-startup-image-portrait.png" />[m
[32m+[m[32m    <Content Include="Content\images\AppIcon120x120.png" />[m
[32m+[m[32m    <Content Include="Content\images\AppIcon152x152.png" />[m
[32m+[m[32m    <Content Include="Content\images\AppIcon60x60.png" />[m
[32m+[m[32m    <Content Include="Content\images\AppIcon76x76.png" />[m
[32m+[m[32m    <Content Include="Content\images\StartUp1024x748.png" />[m
[32m+[m[32m    <Content Include="Content\images\StartUp640x1026.png" />[m
[32m+[m[32m    <Content Include="Content\images\StartUp768X1004.png" />[m
     <Content Include="Content\starterkit.css" />[m
     <Content Include="fonts\fontawesome-webfont.svg" />[m
     <Content Include="fonts\glyphicons-halflings-regular.svg" />[m
[1mdiff --git a/FlashCards/Views/Home/Index.cshtml b/FlashCards/Views/Home/Index.cshtml[m
[1mindex 3e83f86..12714e6 100644[m
[1m--- a/FlashCards/Views/Home/Index.cshtml[m
[1m+++ b/FlashCards/Views/Home/Index.cshtml[m
[36m@@ -10,10 +10,19 @@[m
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />[m
    <meta name="format-detection" content="telephone=no" />[m
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />[m
[32m+[m[41m   [m
[32m+[m[32m   <meta name="apple-mobile-web-app-title" content="Flash Cards">[m
[32m+[m[41m   [m
[32m+[m[32m   <!-- iOS 6 & 7 iPhone 5 -->[m
[32m+[m[32m   <link href="~/Content/images/StartUp640x1026.png"[m
[32m+[m[32m         media="(device-width: 320px) and (device-height: 568px)[m
[32m+[m[32m            and (-webkit-device-pixel-ratio: 2)"[m
[32m+[m[32m         rel="apple-touch-startup-image">[m[41m     [m
 [m
[31m-   <link rel="apple-touch-startup-image" href="~/Content/images/ios-startup-image-landscape.png" media="(orientation:landscape)" />[m
[31m-   <link rel="apple-touch-startup-image" href="~/Content/images/ios-startup-image-portrait.png" media="(orientation:portrait)" />[m
[31m-   <link rel="apple-touch-icon" href="~/Content/images/icon.png" />[m
[32m+[m[32m   <link rel="apple-touch-icon" href="~/Content/images/AppIcon60x60.png" />[m
[32m+[m[32m   <link rel="apple-touch-icon" sizes="76x76" href="~/Content/images/AppIcon76x76.png" />[m
[32m+[m[32m   <link rel="apple-touch-icon" sizes="120x120" href="~/Content/images/AppIcon120x120.png" />[m
[32m+[m[32m   <link rel="apple-touch-icon" sizes="152x152" href="~/Content/images/AppIcon152x152.png" />[m
 [m
    @Styles.Render("~/Content/css")[m
 [m
