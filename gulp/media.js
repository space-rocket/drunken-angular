var Gulp = require('gulp');
var Path = require('path');
var Merge = require('merge-stream');


Gulp.task('media', function () {

    var general = Gulp.src('./client/media/**/*')
        .pipe(Gulp.dest(Path.join('./priv/static', 'fonts')));

    var fonts = Gulp.src('./node_modules/font-awesome/fonts/**')
        .pipe(Gulp.dest(Path.join('./priv/static', 'fonts', 'font-awesome', 'fonts')));

    var images = Gulp.src('./client/images/*')
        .pipe(Gulp.dest(Path.join('./priv/static', 'images')));

    return Merge(general, fonts, images);
});
