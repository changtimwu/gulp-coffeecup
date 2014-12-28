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
  
  it 'should compile coffeecup to html with data', (cb)->
    data = 
      hardcode: 
        help: (attr,text) ->
          div attr, ->
            p text
    stream = coffeecup(data,{})

    stream.on 'data', (file)->
      assert.equal file.relative, 'fixture.html'
      assert.equal file.contents.toString(), """
      <div id="help"><p>SUCCESS</p></div>
      """
      cb()

    stream.write new gutil.File {
      path: 'fixture.md',
      contents: new Buffer """
        help
          id: "help"
          , "SUCCESS"
      """
    }
