module.exports = function(grunt){
	'use strict';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		clean: ['doc'],
		uglify: {
			options: {
				banner: '/*!\n * <%= pkg.description %> v<%= pkg.version %>\n * <%= pkg.author.name %> <<%= pkg.author.email %>>\n * <%= pkg.author.url %>\n * <%= pkg.license.url %>\n * create: 2013/5/16\n * update: <%= grunt.template.today("yyyy/mm/dd") %>\n */\n\n'
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
					linkNatives: 'true',
					attributeEmit: 'true',
					selleck: 'true',
					//ignorePaths: [],
					paths: ['./'],
					outdir: 'doc'
				}
			}
		},
		/*
		jsdoc: {
			generate: {
				src: ['jquery.x.js'],
				options: {
					template: 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template',
					configure: 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template/jsdoc.conf.json',
					destination: 'doc'
				}
			}
		}
		*/
		watch: {
			scripts: {
				files: ['jquery.x.js'],
				tasks: [
					'clean',
					'uglify',
					'yuidoc'
				]
			},
			configFiles: {
				files: ['Gruntfile.js'],
				options: {
					reload: true
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-yuidoc');
	//grunt.loadNpmTasks('grunt-jsdoc');
	grunt.loadNpmTasks('grunt-contrib-watch');

	grunt.registerTask('default', [
		'clean',
		'uglify',
		'yuidoc',
		//'jsdoc' //dependent on java
		'watch'
	]);
};