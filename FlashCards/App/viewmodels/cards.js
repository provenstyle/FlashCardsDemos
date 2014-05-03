define(['durandal/system', 'plugins/router', 'models/selectedCards'], function (system, router, selectedCards) {

   var vm = {}, nameParam = '';

   vm.selected = selectedCards;

   vm.router = router.createChildRouter()
        .makeRelative({
           moduleId:'viewmodels',
           route: 'cards/:param1'
        }).map([
           { route: ['id(/:param2)',''], moduleId: 'card', title: 'Card', nav: true }
        ]).buildNavigationModel();

   vm.activate = function (name) {
      system.log("******** activate for index");
      nameParam = name;
   };

   vm.binding = function() {
      system.log("******** binding complete for index");
      return selectedCards.select(nameParam);
   };

   return vm;

});