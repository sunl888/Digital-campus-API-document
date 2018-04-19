var express = require('express');
var app = express();
app.use('/', express.static('public'));

app.listen(8082, function () {
    console.log('Please enter http://localhost:8082/ in the browser.');
});