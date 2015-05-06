/*
/*	GULP & EKLENTİLER
******************************************************/
var
gulp		= require('gulp'),
uglify	= require('gulp-uglify'),
concat 	= require('gulp-concat'),
sass 		= require('gulp-sass'),
autoprefix 	= require('gulp-autoprefixer'),
coffee 	= require('gulp-coffee'),
cssmin 	= require('gulp-minify-css'),
open 		= require('gulp-open'),
connect 	= require('gulp-connect');

/*
/*	İŞLER GÜÇLER
******************************************************/
// Sass to Css
gulp.task('sasstocss', function () {
	gulp.src("app/scss/*.scss")
	.pipe(sass({ style: 'compressed' }))
	.pipe(autoprefix('last 15 version'))
	.pipe(cssmin({compatibility: 'ie8'}))
	.pipe(concat('app.min.css'))
	.pipe(gulp.dest("public/assets/css"));
});

// Coffeescript to Javascript
gulp.task('coffeetojs', function () {
	gulp.src("app/coffee/*.coffee")
	.pipe(coffee())
	.pipe(uglify())
	.pipe(concat('app.min.js'))
	.pipe(gulp.dest("public/assets/js"));
});
// Değişiklik olduğunda sayfayı yenile
gulp.task('reload', function () {
	gulp.src('public')
	.pipe(connect.reload());
});

// Dosyaları izle
gulp.task('watch', function () {
	gulp.watch("app/scss/*.scss", 					['sasstocss', 'reload']);
	gulp.watch("app/coffee/*.coffee",					['coffeetojs', 'reload']);
	gulp.watch(["public/index.html", "public/pages/*.html"],	['reload']);
});

// Server oluştur
gulp.task('start', function () {
	connect.server({
		root: 'public',
		port: 3000,
		livereload: true
	});
})
// Burası gulp ile otomatik olarak çalışır
gulp.task('default', ['sasstocss', 'coffeetojs', 'watch', 'start'], function(){
	gulp.src('public/index.html').pipe(open('', { url: 'http://localhost:3000'}));
});