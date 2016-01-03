var Path = require('path');
var Gulp = require('gulp');
var Newer = require('gulp-newer');
var Concat = require('gulp-concat');

Gulp.task('angular', function () {

    var bundleConfigs = [{
        entries: [
            './node_modules/angular2/bundles/angular2-polyfills.js',
            './node_modules/systemjs/dist/system.src.js',
            './node_modules/rxjs/bundles/Rx.js',
            './node_modules/angular2/bundles/angular2.dev.js'
        ],
        dest: './priv/static/js',
        outputName: 'angular-build.js'
    }];

    return bundleConfigs.map(function (bundleConfig) {

        return Gulp.src(bundleConfig.entries)
            .pipe(Newer(Path.join(bundleConfig.dest, bundleConfig.outputName)))
            .pipe(Concat(bundleConfig.outputName))
            .pipe(Gulp.dest(bundleConfig.dest));
    });
});
