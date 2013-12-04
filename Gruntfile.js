'use strict';

module.exports = function(grunt) {
require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
grunt.initConfig({
	pkg: grunt.file.readJSON('package.json'),

	dirs: {
		ROOT: '/',
		CSS: 'css',
		SCSS: 'css/scss',
		DEV_JS: 'js/dev',
		JS: 'js',
		IMAGES: 'images',
		PREMINIFY_IMAGES: 'images/preminify',
	},

	open: {
		server: {
			path: 'http://localhost/cheatly'
		}
	},

	clean: {
		build: {
			src: [
				'<%= dirs.IMAGES %>/*.{png,jpg,jpeg,gif}',
				'<%= dirs.CSS %>/**/*.css',
				'<%= dirs.JS %>/*.js',
			]
		},
		js: {
			src: ['<%= dirs.JS %>/plugins.js']
		}
	},

	jshint: {
		options: {
			curly: true,
			eqeqeq: true,
			eqnull: true,
			browser: true,
			indent: 4,
			undef: true,
			unused: true,
			evil: true,
			devel:true,
			globals: {
				jQuery: true
			},
			ignores: ['<%= dirs.JS %>/plugins.min.js']
		},
		uses_defaults: ['<%= dirs.JS %>/*.js'],
	},

	compass: {
		compile: {
			options: {
				httpPath: '<%= dirs.ROOT %>',
				cssDir:'<%= dirs.CSS %>',
				sassDir: '<%= dirs.SCSS %>',
				imagesDir: '<%= dirs.PREMINIFY_IMAGES %>',
				outputStyle: 'expanded',
				relativeAssets: true,
				raw: 'preferred_syntax = :scss\n',
				force: true
			},
		}
	},

	csslint: {
		strict: {
			options: {
				'import': 2,
				'empty-rules': 2,
				'duplicate-properties': 2,
				'known-properties': 2,
				'vendor-prefix': 2,
				'star-property-hack': 2,
				'underscore-property-hack': 2,
				'universal-selector': 2,
				'zero-units': 2,
				'shorthand': 2
			},
			src: ['<%= dirs.CSS %>/*.css']
		}
	},

	concat: {
		options: { separator: ';' },
		plugins: {
			src: ['<%= dirs.DEV_JS %>/plugins/*.js'],
			dest: '<%= dirs.DEV_JS %>/plugins.js',
		}
	},

	imagemin: {
		optimize:{
			options:{
				pngquant: false
			},
			files: [{
				expand: true,
				cwd: '<%= dirs.PREMINIFY_IMAGES %>/',
				src: ['**/*.{png,gif}'],
				dest: '<%= dirs.IMAGES %>/'
			}]
		}
	},

	uglify: {
		target: {
			cwd: '<%= dirs.DEV_JS %>',
			src: ['*.js'],
			dest: '<%= dirs.JS %>',
			expand: true,
			ext: '.min.js'
		},
	},

	watch: {
		options:{
			livereload: true,
			nospawn: true
		},
		compass: {
			files: ['<%= dirs.CSS %>/**/*.scss'],
			tasks: ['compass:compile'],
		},
		csslint: {
			files: ['<%= dirs.CSS %>/*.css'],
			tasks: ['csslint'],
		},
		jshint: {
			files: ['<%= dirs.JS %>/*.js'],
			tasks: ['jshint'],
		},
		concat: {
			files: ['<%= concat.plugins.src %>'],
			tasks: ['concat'],
		},
		clean: {
			files: ['<%= dirs.JS %>/*.min.js'],
			tasks: ['clean'],
		},
		imagemin: {
			files: ['<%= dirs.PREMINIFY_IMAGES %>/**/*.{png,jpg,jpeg,gif}'],
			tasks: ['imagemin'],
		},
		uglify: {
			files: ['<%= dirs.JS %>/*.js'],
			tasks: ['uglify'],
		}
	}
});

grunt.registerTask('default', 'dev');
grunt.registerTask('dev', ['clean:build', 'compass', 'jshint', 'concat', 'imagemin', 'uglify', 'clean:js', 'open', 'watch']);

};