assert = require('assert')
gutil = require('gulp-util')
coffeekup = require('./index')

describe 'gulp-coffeekup', ()->
  it 'should compile coffeekup to html', (cb)->
    stream = coffeekup()

    stream.on 'data', (file)->
      assert.equal file.relative, 'fixture.html'
      assert.equal file.contents.toString(), '<h1>☕</h1>'
      cb()

    stream.write new gutil.File {
      path: 'fixture.md',
      contents: new Buffer "h1 '☕'"
    }
