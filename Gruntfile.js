module.exports = function(grunt){
	'use strict';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			options: {
				banner: '/*!\n * <%=pkg.description%> v<%=pkg.version%>\n * author: <%=pkg.author%>\n * create: 2013/5/16\n * update: <%=grunt.template.today("yyyy/mm/dd")%>\n */\n\n '
			},
			jqueryX: {
				files: {
					'jquery.x.min.js': ['jquery.x.js']
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');

	grunt.registerTask('default', ['uglify']);
}
