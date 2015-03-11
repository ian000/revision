gulp=require('gulp');
rev=require('gulp-rev');
fs = require 'fs'
override=require('gulp-rev-css-url')
jade=require('jade');
jade = require('gulp-jade')
rename = require('gulp-rename')
_ = require('lodash')
handlebarOpts = 
    jade : jade
    data : 
        assetPath:"./app"
gulp.task 'rev',()->
    return gulp.src('./app/**/*')
                .pipe(rev())
                .pipe(override())
                .pipe(gulp.dest('./dist/'))
                .pipe(rev.manifest())
                .pipe(gulp.dest('./dist/'))
gulp.task 'revHTML',["rev"], ()->
    
    manifest = JSON.parse(fs.readFileSync('./dist/rev-manifest.json', 'utf8'));
    
    statics =
        assetPath : "./app",
        manifest : manifest

    return gulp.src('index.jade')
        .pipe jade
            locals: statics,
            pretty: true
        .pipe(gulp.dest('./dist/'))

gulp.task 'default', ["revHTML"]