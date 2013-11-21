module.exports = function(grunt){
	'use strict';

	var path_yuidoc = '.';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		clean: [path_yuidoc + '/doc'],
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
					//tabtospace: 4,
					paths: [path_yuidoc],
					outdir: path_yuidoc + '/doc'
				}
			}
		}
		/*
		jsdoc: {
			generate: {
				src: [path_yuidoc + '/jquery.x.js'],
				options: {
					template: 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template',
					configure: 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template/jsdoc.conf.json',
					destination: path_yuidoc + '/doc'
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
