# gulp-coffeecup

## Install

```bash
npm install --save-dev gulp-coffeecup
```

## Usage

```js
var gulp = require('gulp');
var ck = require('gulp-coffeecup');

gulp.task('default', function() {
  return gulp.src('./template/**/*.coffee')                                     
    .pipe(ck())
    .pipe(gulp.dest('./dist'));
});

```
