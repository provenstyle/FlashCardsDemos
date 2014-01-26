define(function () {

   var vm = {
      nameParam: ''
   };

   vm.activate = function (name) {
      vm.nameParam = name;
   };

   return vm;

});