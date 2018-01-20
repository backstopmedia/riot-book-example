module.exports = function (config) {
  config.set({
    basePath: '',
    browsers: ['Electron'],
    frameworks: ['mocha', 'chai', 'riot'],
    files: [
      '../src/**/*.tag',
      '*.test.js'
    ],
    reporters: ['progress'],
    preprocessors: {
      '../src/**/*.tag': ['riot']
    },
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    singleRun: true
  })
}
