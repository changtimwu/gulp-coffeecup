assert = require('assert')
gutil = require('gulp-util')
coffeecup = require('./index')

describe 'gulp-coffeecup', ()->
  it 'should compile coffeecup to html', (cb)->
    stream = coffeecup()

    stream.on 'data', (file)->
      assert.equal file.relative, 'fixture.html'
      assert.equal file.contents.toString(), '<h1>☕</h1>'
      cb()

    stream.write new gutil.File {
      path: 'fixture.md',
      contents: new Buffer "h1 '☕'"
    }
