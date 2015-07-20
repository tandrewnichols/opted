module.exports = {
  options: {
    targets: {
      test: '{{ version }}',
      when: 'v0.12',
      tasks: ['istanbul', 'matrix:v0.12']
    }
  }
};
