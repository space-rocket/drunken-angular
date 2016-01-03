var Gulp = require('gulp');
var Gutil = require('gulp-util');
var Webpack = require('webpack');
var Path = require('path');

var CommonsChunkPlugin = Webpack.optimize.CommonsChunkPlugin;
var UglifyJsPlugin = Webpack.optimize.UglifyJsPlugin;
var executionCount = 0;


Gulp.task('webpack', function (callback) {

    var config = {
        watch: global.isWatching,
        entry: {
            app: './web/static/js/app.js'
        },
        output: {
            path: './priv/static/js',
            filename: 'js/[name].min.js',
            sourceMapFilename: '[name].map.js'
        },
        resolve: {
            extensions: ['', '.js'],
            modulesDirectories: [ __dirname ]
        },
        module: {
            loaders: [
                { test: /\.js$/, exclude: /node_modules/, loaders: ["babel"], include: __dirname }
            ]
        },
        devtool: 'source-map',
        plugins: [
            new CommonsChunkPlugin('./core.min.js', undefined, 2),
            new UglifyJsPlugin({ compress: { warnings: false } })
        ]
    };

    Webpack(config, function (err, stats) {

        if (err) {
            throw new Gutil.PluginError('webpack', err);
        }

        Gutil.log('[webpack]', stats.toString({
            colors: true,
            chunkModules: false
        }));

        if (executionCount === 0) {
            callback();
        }
        executionCount += 1;
    });
});
