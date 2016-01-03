'use strict';
var GulpConfig = (function () {
    function gulpConfig() {
        //Got tired of scrolling through all the comments so removed them
        //Don't hurt me AC :-)
        this.source = './src/';
        this.sourceApp = this.source + 'app/';

        this.tsOutputPath = this.source + '../priv/static/js';
        this.allJavaScript = [this.source + '*.js'];
        this.allTypeScript = this.sourceApp + '/**/*.ts';

        this.typings = '../src/typings/';
        this.libraryTypeScriptDefinitions = '../src/typings/**/*.ts';
    }
    return gulpConfig;
})();
module.exports = GulpConfig;
