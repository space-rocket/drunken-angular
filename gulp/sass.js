var Path = require('path');
var Gulp = require('gulp');
var Newer = require('gulp-newer');
var Concat = require('gulp-concat');
var Sass = require('gulp-sass');

Gulp.task('sass', function () {

    var bundleConfigs = [{
        entries: [
            './client/core/variables.scss',
            './client/core/bootstrap.scss',
            './client/core/font-awesome.scss',
            './client/core/theme.scss',
            './client/core/custom.scss'
        ],
        dest: './priv/static/css',
        outputName: 'app.css'
    }, {
        entries: './client/pages/home/home.scss',
        dest: './priv/static/css',
        outputName: 'home.min.css'
    }, {
        entries: './client/pages/bingo/bingo.scss',
        dest: './priv/static/css',
        outputName: 'bingo.min.css'
    }, {
        entries: './client/pages/posts/posts.scss',
        dest: './priv/static/css',
        outputName: 'posts.css'
    }];

    return bundleConfigs.map(function (bundleConfig) {

        return Gulp.src(bundleConfig.entries)
            .pipe(Newer(Path.join(bundleConfig.dest, bundleConfig.outputName)))
            .pipe(Concat(bundleConfig.outputName))
            // .pipe(Sass({outputStyle: 'compressed'}))
            .pipe(Sass())
            .pipe(Gulp.dest(bundleConfig.dest));
    });
});
