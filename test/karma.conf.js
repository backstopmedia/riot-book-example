module.exports = function (config) {
  config.set({
    basePath: '',
    browsers: ['Electron'],
    frameworks: ['mocha', 'chai', 'riot'],
    files: [
      '../src/**/*.tag',
      '*.test.js'
    ],
    reporters: ['progress', 'coverage'],
    preprocessors: {
      '../src/**/*.tag': ['riot']
    },
    coverageReporter: {
      reporters: [
        { type: 'lcovonly', dir : '../coverage/' }
      ]
    },
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    singleRun: true
  })
}
