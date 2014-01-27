define(['plugins/router'], function(router) {
   return {
      router: router,
      activate: function() {
         router.map([            
            { route: ['', 'about'], title: 'About', moduleId: 'viewmodels/about', nav: true }
         ]).buildNavigationModel();

         router.mapUnknownRoutes('viewmodels/catalog', "#catalog");

         return router.activate();
      },
   };
});