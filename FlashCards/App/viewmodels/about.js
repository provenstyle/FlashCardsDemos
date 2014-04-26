define(['durandal/system'], function(system) {
    var vm = {};

    vm.activate = function () {
        system.log('** activate about');
    };

    vm.attached = function () {
        system.log('** attached about');
    };

    vm.canActivate = function () {
        system.log('** canActivate about');
        return true;
    };

    return vm;
});