const path = require('path');

const TerserPlugin = require('terser-webpack-plugin');

module.exports = {
  mode: 'production',
  entry: path.resolve(__dirname, 'frontend/js/index.js'),
  output: {
    filename: 'tinymce.js',
    path: path.resolve(__dirname, 'app/assets/bundle/trestle')
  },
  optimization: {
    minimizer: [
      new TerserPlugin({
        extractComments: false
      })
    ]
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [
          { loader: 'babel-loader' }
        ]
      }
    ]
  }
};
