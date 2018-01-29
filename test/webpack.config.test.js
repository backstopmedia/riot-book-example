const path = require('path')

module.exports = {
  entry: './test/components.js',
  output: {
    path: path.join(__dirname, '../test/dist'),
    publicPath: 'test/',
    filename: 'bundle.js',
    libraryTarget: 'umd',
    library: 'riot',
    umdNamedDefine: true
  },
  resolve: {
    alias: {
      '@': path.join(__dirname, '../src')
    }
  },
  module: {
    rules: [
      {
        test: /\.tag$/,
        exclude: /node_modules/,
        loader: 'riot-tag-loader',
        enforce: 'pre',
        query: {
          type: 'es6'
        }
      },
      {
        test: /\.(js)$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            babelrc: false,
            presets: ['env'],
            plugins: ['add-module-exports']
          }
        }
      },
      { test: /\.(png|jpe|jpg|woff|woff2|eot|ttf|svg)(\?.*$|$)/, loader: 'url-loader' },
    ]
  }
}
