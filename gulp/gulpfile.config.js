'use strict';
var GulpConfig = (function () {
    function gulpConfig() {
        //Got tired of scrolling through all the comments so removed them
        //Don't hurt me AC :-)
        this.source = './client/';
        this.sourceApp = this.source;

        this.tsOutputPath = this.source + '../priv/static/js';
        this.allJavaScript = [this.source + '*.js'];
        this.allTypeScript = this.sourceApp + '/**/*.ts';

        this.typings = '../client/typings/';
        this.libraryTypeScriptDefinitions = '../client/typings/**/*.ts';
    }
    return gulpConfig;
})();
module.exports = GulpConfig;
