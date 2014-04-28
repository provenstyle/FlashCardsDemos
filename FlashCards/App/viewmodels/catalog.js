define(['durandal/system', 'services/FlashCardService'], function (system, service) {
    var vm = {};

    vm.catalogNames = [];

    vm.activate = function () {
        system.log("** activate catalog");
        service.catalogNames()
            .done(function(data) {
            vm.catalogNames = data;
        });
    };

    vm.attached = function () {
        system.log('** attached catalog');
    };

    vm.canDeactivate = function () {
        return true;
    };

    vm.goToCards = function(name) {
        system.log('Go to ' + name);
    };

    return vm;
});