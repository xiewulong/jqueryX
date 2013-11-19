module.exports = function(grunt){
	'use strict';

	var docstrap = 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			options: {
				banner: '/*!\n * @file <%= pkg.description %>\n * @version <%= pkg.version %>\n * @author <%= pkg.author.name %> <<%= pkg.author.email %>>\n * @copyright {@link <%= pkg.license.url %> 2013}\n * @license {@link <%= pkg.license.url %> MIT}\n * @create 2013/5/16\n * @update <%= grunt.template.today("yyyy/mm/dd") %>\n */\n\n'
			},
			compress: {
				files: {
					'jquery.x.min.js': ['jquery.x.js']
				}
			}
		},
		clean: ['doc'],
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
	});

	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-jsdoc');

	grunt.registerTask('default', [
		'clean',
		'uglify',
		'jsdoc' //dependent on java
	]);
}
