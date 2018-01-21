module.exports = function (config) {
  config.set({
    basePath: '',
    browsers: ['Electron'],
    frameworks: ['mocha', 'chai', 'riot'],
    files: [
      '../src/components/*.tag',
      '*.test.js'
    ],
    reporters: ['progress'],
    preprocessors: {
      '../src/components/*.tag': ['riot']
    },
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    singleRun: true
  })
}
