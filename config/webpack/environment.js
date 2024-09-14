const { environment } = require('@rails/webpacker')

// ProvidePluginを加えることで、importやrequireなしで$やbootstrap関連のjs(popper.js)が使用可能になる
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

module.exports = environment
