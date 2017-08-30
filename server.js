const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const request = require('request')
const apiKey = key.env.API_Key
const apiSecret = key.env.API_Secret

require('dotenv').config()

app.set('view engine', 'ejs')
app.use(express.static('public'))
app.use(bodyParser).urlencoded({ extended: true })

app.get('/', function (req, res) {
  res.render('index')
})

app.post('/', function (req, res) {
  console.log(req.body.animal)
  res.render('index')
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})
