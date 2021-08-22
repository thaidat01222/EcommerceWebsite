const express = require('express');
var cors = require('cors');
const app = require('express')();
const port = process.env.PORT || 4000;
const path = require('path');
const bodyParser = require('body-parser');
const api = require('./api/api')
const cookieParser = require('cookie-parser');

app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieParser());
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({
    extended: true,
    limit: '50mb'
}));

app.use(cors())

api.registerEndpoint(app)

app.listen(port, () => console.log("Server running in port " + port));