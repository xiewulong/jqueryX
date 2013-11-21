module.exports = function(grunt){
	'use strict';

	var docstrap = 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		clean: ['doc'],
		uglify: {
			options: {
				banner: '/*!\n * <%= pkg.description %> v<%= pkg.version %>\n * <%= pkg.author.email %>\n * <%= pkg.author.url %>\n * <%= pkg.license.url %>\n * create: 2013/5/16\n * update: <%= grunt.template.today("yyyy/mm/dd") %>\n */\n\n'
			},
			compress: {
				files: {
					'jquery.x.min.js': ['jquery.x.js']
				}
			}
		},
		yuidoc: {
			generate: {
				name: '<%= pkg.name %>',
				description: '<%= pkg.description %>',
				version: '<%= pkg.version %>',
				url: '<%= pkg.author.url %>',
				options: {
					//themedir: 'node_modules/grunt-contrib-yuidoc/node_modules/yuidocjs/themes/simple',
					tabtospace: 4,
					paths: ['.'],
					outdir: 'doc'
				}
			}
		}
		/*
		jsdoc: {
			generate: {
				src: ['jquery.x.js'],
				options: {
					template: docstrap,
					configure: docstrap + '/jsdoc.conf.json',
					destination: 'doc'
				}
			}
		}
		*/
	});

	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-yuidoc');
	//grunt.loadNpmTasks('grunt-jsdoc');

	grunt.registerTask('default', [
		'clean',
		'uglify',
		'yuidoc'
		//'jsdoc' //dependent on java
	]);
}
