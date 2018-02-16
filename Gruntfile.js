// Asura Gruntfile
module.exports = function (grunt) {
  'use strict';

  grunt.initConfig({
    pkg   : grunt.file.readJSON('package.json'),
    watch : {
      less : {
        files: ['../asura/build/less/*.less', '../asura/build/less/skins/*.less'],
        tasks: ['less:production', 'notify:less']
      },
      js   : {
        files: ['../asura/build/js/*.js'],
        tasks: ['js', 'notify:js']
      },
    },
    notify: {
      less: {
        options: {
          title  : 'Asura',
          message: 'LESS finished running'
        }
      },
      js  : {
        options: {
          title  : 'Asura',
          message: 'JS bundler finished running'
        }
      }
    },
    less  : {
      production   : {
        options: {
          compress: true
        },
        files  : {
          'assets/css/asura.min.css'                 : '../asura/build/less/asura.less',
          'assets/css/asura-without-plugins.min.css' : '../asura/build/less/asura-without-plugins.less',
          'assets/css/asura-select2.min.css'         : '../asura/build/less/select2.less',
          'assets/css/asura-fullcalendar.min.css'    : '../asura/build/less/fullcalendar.less',
          'assets/css/asura-bootstrap-social.min.css': '../asura/build/less/bootstrap-social.less',
          'assets/css/asura-skins.min.css'           : '../asura/build/less/skins/_all-skins.less'
        }
      },
    },
    uglify: {
      options   : {
        mangle          : true,
        preserveComments: 'some'
      },
      production: {
        files: {
          'assets/js/asura.min.js': ['assets/js/asura.js']
        }
      }
    },

    // Concatenate JS Files
    concat: {
      options: {
        separator: '\n\n',
        banner   : '/*! Asura app.js\n'
        + '* ================\n'
        + '* Main JS application file for Asura Admin Template. This file\n'
        + '* should be included in all pages. It controls some layout\n'
        + '* options and implements exclusive Asura plugins.\n'
        + '*\n'
        + '* @Author  Aris Ripandi\n'
        + '* @Support <https://www.almsaeedstudio.com>\n'
        + '* @Email   <ripandi@protonmail.com>\n'
        + '* @version <%= pkg.version %>\n'
        + '* @repository <%= pkg.repository.url %>\n'
        + '* @license MIT <http://opensource.org/licenses/MIT>\n'
        + '*/\n\n'
        + '// Make sure jQuery has been loaded\n'
        + 'if (typeof jQuery === \'undefined\') {\n'
        + 'throw new Error(\'Asura requires jQuery\')\n'
        + '}\n\n'
      },
      dist   : {
        src : [
          '../asura/build/js/BoxRefresh.js',
          '../asura/build/js/BoxWidget.js',
          '../asura/build/js/ControlSidebar.js',
          '../asura/build/js/DirectChat.js',
          '../asura/build/js/Layout.js',
          '../asura/build/js/PushMenu.js',
          '../asura/build/js/TodoList.js',
          '../asura/build/js/Tree.js',
          '../asura/build/js/Input.js',
          'assets/js/application.js'
        ],
        dest: 'assets/js/asura.js'
      }
    },

    // Optimize images
    image: {
      dynamic: {
        files: [
          {
            expand: true,
            cwd   : '../asura/build/img/',
            src   : ['**/*.{png,jpg,gif,svg,jpeg}'],
            dest  : 'assets/img/'
          }
        ]
      }
    },

    // Validate code
    jshint: {
      options: {
        jshintrc: '../asura/build/js/.jshintrc'
      },
      grunt  : {
        options: {
          jshintrc: '../asura/build/grunt/.jshintrc'
        },
        src    : 'Gruntfile.js'
      },
      core   : {
        src: '../asura/build/js/*.js'
      },
      demo   : {
        src: 'assets/js/demo.js'
      },
      pages  : {
        src: 'assets/js/pages/*.js'
      }
    },
    jscs: {
      options: {
        config: '../asura/build/js/.jscsrc'
      },
      core   : {
        src: '<%= jshint.core.src %>'
      },
      pages  : {
        src: '<%= jshint.pages.src %>'
      }
    },
    csslint: {
      options: {
        csslintrc: '../asura/build/less/.csslintrc'
      },
      dist   : [
        'assets/css/asura.css'
      ]
    },
    clean: {
      build: ['../asura/build/img/*']
    }
  });

  // Load all grunt tasks
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-includes');
  grunt.loadNpmTasks('grunt-image');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-jscs');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-csslint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-notify');
  grunt.loadNpmTasks('grunt-text-replace');

  // Retister tasks
  grunt.registerTask('lint', ['jshint', 'csslint']);
  grunt.registerTask('js', ['concat', 'uglify']);
  grunt.registerTask('css', ['less:production']);

  // The default task (running 'grunt' in console) is 'watch'
  grunt.registerTask('default', ['watch']);
};
