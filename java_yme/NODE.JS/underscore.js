const _ = require('underscore');

var arr = [3,6,9,1,12];
//배열 처음
console.log(arr[0]);
console.log(_.first(arr));
//배열 마지막
console.log(arr[arr.length-1]);
console.log(_.last(arr));