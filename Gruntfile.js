module.exports = function(grunt){
	'use strict';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		uglify: {
			options: {
				banner: '/*!\n * <%=pkg.description%> v<%=pkg.version%>\n * author: <%=pkg.author%>\n * create: 2013/5/16\n * update: <%=grunt.template.today("yyyy/mm/dd")%>\n */\n\n '
			},
			compress: {
				files: {
					'jquery.x.min.js': ['jquery.x.js']
				}
			}
		},
    jsdoc: {
      gerenate: {
        src: ['jquery.xjs'],
        options: {
          destination: 'doc'
        }
      }
    }
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-jsdoc-plugin');

	grunt.registerTask('default', [
    'uglify',
    //'jsdoc' //dependent on java
  ]);
}
