gutil = require('gulp-util')
through = require('through2')
ck = require('coffeecup')

gulpCoffeecup = (options)->
  through.obj (file, enc, cb)->
    if file.isNull()
      @push file
      return cb()
    if file.isStream()
      @emit 'error', new gutil.PluginError 'gulp-coffeecup',
        'Streaming not supported'
      return cb()
    try
      html = ck.render file.contents.toString(), {}, options
      file.contents = new Buffer(html)
      file.path = gutil.replaceExtension file.path, '.html'
    catch err
      @emit 'error', new gutil.PluginError 'gulp-coffeecup', err
    @push file
    cb()

module.exports = gulpCoffeecup
