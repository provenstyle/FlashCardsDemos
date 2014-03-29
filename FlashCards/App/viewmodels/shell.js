define(['plugins/router'], function(router) {
   return {
      router: router,
      activate: function() {
         router.map([
         ]).buildNavigationModel();


         return router.activate();
      },
   };
});