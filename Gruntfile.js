var tm = require('task-master');

module.exports = function(grunt) {
  tm(grunt, {
    jit: {
      travis: 'grunt-travis-matrix',
      matrix: 'grunt-travis-matrix'
    }
  });
  grunt.registerTask('mocha', ['mochaTest:test']);
  grunt.registerTask('default', ['jshint:all', 'mocha']);
  grunt.registerTask('coverage', ['istanbul', 'open:coverage']);
  grunt.registerTask('ci', ['default', 'travis']);
};
