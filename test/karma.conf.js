module.exports = function (config) {
  config.set({
    basePath: '',
    browsers: ['Electron'],
    frameworks: ['mocha', 'chai', 'riot'],
    files: [
      '../dist/dashboard.js',
      'e2e/*.test.js'
    ],
    reporters: ['progress', 'coverage'],
    preprocessors: {
      '../dist/dashboard.js': ['coverage']
    },
    coverageReporter: {
      reporters: [
        { type:'lcovonly', dir : '../coverage/' }
      ]
    },
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    singleRun: true
  })
}
