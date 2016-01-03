var Path = require('path');
var Gulp = require('gulp');
var Elm  = require('gulp-elm');
var Concat = require('gulp-concat');
var Newer = require('gulp-newer');


Gulp.task('elm-init', Elm.init);

Gulp.task('elm', ['elm-init'], function () {

  var bundleConfigs = [{
      entries: './client/pages/home/home.elm',
      dest: './priv/static/js',
      outputName: 'home.js'
  }, {
      entries: './client/pages/bingo/bingo.elm',
      dest: './priv/static/js',
      outputName: 'bingo.js'
  }, {
      entries: './client/pages/artist/artist.elm',
      dest: './priv/static/js',
      outputName: 'blog.js'
  }, {
      entries: './client/pages/sign-in/sign-in.elm',
      dest: './priv/static/js',
      outputName: 'sign-in.js'
  }, {
      entries: './client/pages/sign-up/sign-up.elm',
      dest: './priv/static/js',
      outputName: 'sign-up.js'
  }];

  return bundleConfigs.map(function (bundleConfig) {

      return Gulp.src(bundleConfig.entries)
          .pipe(Newer(Path.join(bundleConfig.dest, bundleConfig.outputName)))
          .pipe(Concat(bundleConfig.outputName))
          .pipe(Elm())
          .pipe(Gulp.dest(bundleConfig.dest));
  });

});
