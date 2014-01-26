define(function() {
   var vm = {
      indexParam: 0
   };
   
   vm.activate = function (name, index) {
      
      vm.indexParam = index ? index : 0;
   };
   
   return vm;
});