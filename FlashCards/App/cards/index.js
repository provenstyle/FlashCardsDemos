define(['plugins/router'], function (router) {

   var vm = {
      nameParam: ''
   };

   vm.router = router.createChildRouter()
        .makeRelative({
           moduleId:'cards',
           route: 'cards/:param1'
        }).map([
           { route: ['id(/:param2)',''], moduleId: 'card', title: 'Card', nav: true }
        ]).buildNavigationModel();

   vm.activate = function (name) {
      vm.nameParam = name;
   };

   return vm;

});