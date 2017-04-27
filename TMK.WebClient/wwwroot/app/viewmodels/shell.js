define(['plugins/router', 'bootstrap'], function (router) {
    var vm = {};
    vm.router = router;
    vm.activate = function () {
        router.map([
             { route: '', title: 'Home', moduleId: 'viewmodels/home', nav: true },
             { route: 'page1', title: 'Page1', moduleId: 'viewmodels/page1', nav: true }
        ]).buildNavigationModel();

        return router.activate();
    };

    return vm;
});