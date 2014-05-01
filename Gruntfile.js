module.exports = function(grunt){
	'use strict';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		config: {
			baseUrl: '.',
		},
		clean: [
			'<%=config.baseUrl%>/*.min.js',
			'<%=config.baseUrl%>/doc',
		],
		uglify: {
			js: {
				options: {
					banner: '/*!\n * <%=pkg.description%> v<%=pkg.version%>\n * <%=pkg.author.name%> <<%=pkg.author.email%>>\n * <%=pkg.author.url%>\n * <%=pkg.license.url%>\n * create: 2013/5/16\n * update: <%=grunt.template.today("yyyy/mm/dd")%>\n */\n\n',
				},
				expand: true,
				//cwd: '',
				src: [
					'<%=config.baseUrl%>/*.js',
					'!<%=config.baseUrl%>/*.min.js',
					'!<%=config.baseUrl%>/Gruntfile.js',
				],
				//dest: '',
				ext: '.min.js',
			},
		},
		yuidoc: {
			generate: {
				name: '<%=pkg.name%>',
				description: '<%=pkg.description%>',
				version: '<%=pkg.version%>',
				url: '<%=pkg.author.url%>',
				options: {
					//themedir: 'node_modules/grunt-contrib-yuidoc/node_modules/yuidocjs/themes/simple',
					//tabtospace: 4,
					linkNatives: 'true',
					attributeEmit: 'true',
					selleck: 'true',
					//ignorePaths: [],
					paths: ['<%=config.baseUrl%>/'],
					outdir: '<%=config.baseUrl%>/doc',
				},
			},
		},
		/*
		jsdoc: {
			generate: {
				src: ['jquery.x.js'],
				options: {
					template: 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template',
					configure: 'node_modules/grunt-jsdoc/node_modules/ink-docstrap/template/jsdoc.conf.json',
					destination: 'doc',
				},
			},
		},
		*/
		watch: {
			scripts: {
				files: ['jquery.x.js'],
				tasks: [
					'clean',
					'uglify',
					'yuidoc',
				],
			},
			configFiles: {
				files: ['Gruntfile.js'],
				options: {
					reload: true,
				},
			},
		},
	});

	//grunt.loadNpmTasks('grunt-contrib-less');
	//grunt.loadNpmTasks('grunt-contrib-csslint');
	//grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-clean');
	//grunt.loadNpmTasks('grunt-contrib-htmlmin');
	//grunt.loadNpmTasks('grunt-contrib-cssmin');
	//grunt.loadNpmTasks('grunt-contrib-imagemin');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	//grunt.loadNpmTasks('grunt-contrib-concat');
	//grunt.loadNpmTasks('grunt-contrib-requirejs');
	grunt.loadNpmTasks('grunt-contrib-yuidoc');
	//grunt.loadNpmTasks('grunt-jsdoc');
	grunt.loadNpmTasks('grunt-contrib-watch');

	grunt.registerTask('default', [
		'clean',
		'uglify',
		'yuidoc',
		//'jsdoc', //dependent on java
	]);
};