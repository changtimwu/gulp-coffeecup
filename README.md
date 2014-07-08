# gulp-coffeekup

## Install

```bash
npm install --save-dev gulp-coffeekup
```

## Usage

```js
var gulp = require('gulp');
var coffeekup = require('gulp-coffeekup');

gulp.task('default', function() {
  return gulp.src('./template/**/*.coffee')                                     
    .pipe(coffeekup())
    .pipe(gulp.dest('./dist'));
});

```
