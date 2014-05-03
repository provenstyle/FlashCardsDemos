define([], function() {
    var vm = {};
    vm.indexParam = 0;

    vm.activate = function(name, index) {
        vm.indexParam = index;
    };

    return vm;
});