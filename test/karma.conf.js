module.exports = function (config) {
  config.set({
    basePath: '',
    browsers: ['Electron'],
    frameworks: ['mocha', 'chai'],
    plugins: [
      'karma-mocha',
      'karma-mocha-reporter',
      'karma-chai',
      'karma-browserify',
      'karma-webpack',
      'karma-electron'
    ],
    files: [
      './mocks.js',
      './bundle.js',
      '**/specs/*.test.js'
    ],
    reporters: ['progress', 'mocha'],
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    singleRun: true
  })
}
