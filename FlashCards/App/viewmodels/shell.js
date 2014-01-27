define(['plugins/router'], function(router) {
   return {
      router: router,
      activate: function() {
         router.map([
         ]).buildNavigationModel();

         router.mapUnknownRoutes('viewmodels/catalog', "#catalog");

         return router.activate();
      },
   };
});