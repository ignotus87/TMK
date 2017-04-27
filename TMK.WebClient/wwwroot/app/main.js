requirejs.config({
    paths: {
        'jquery': '../lib/jquery/dist/jquery',
        'text': '../lib/requirejs-text/text',
        'durandal': '../lib/Durandal/js',
        'plugins': '../lib/Durandal/js/plugins',
        'transitions': '../lib/Durandal/js/transitions',
        'knockout': '../lib/knockout/dist/knockout',

        'bootstrap': '../lib/bootstrap/dist/js/bootstrap'
    },
    shim: {
        bootstrap: ['jquery']
    }
});

define(['durandal/app', 'durandal/system', 'jquery', 'durandal/viewLocator'], function (app, system, $, viewLocator) {
    system.debug(true);
    app.title = 'Durandal Starter Kit';

    app.configurePlugins({
        router: true,
        dialog: true
    });

    app.start().then(function () {
        // Replace 'viewmodels' in the moduleId with 'views' to locate the view.
        // Look for partial views in a 'views' folder in the root.
        viewLocator.useConvention();

        app.setRoot('viewmodels/shell');
    });
});