var express = require('express')
var app = express()
var server = require('http').createServer(app)
var port = process.env.PORT || 3000
var morgan = require('morgan')

app.set('view engine', 'ejs')
app.set('views', './views')

//logging middleware

app.use(morgan('dev'))

app.use(express.static(__dirname + '/public'))

app.get('/', function(req,res){
  res.render('index')
})

server.listen(port, function(){
  console.log('Server has been started on port %s', port)
})

var io = require('socket.io')(server)
var Twit = require('twit')

var twitter = new Twit({
    consumer_key:         process.env.TWITTER_CONSUMER_KEY
  , consumer_secret:      process.env.TWITTER_CONSUMER_SECRET
  , access_token:         process.env.TWITTER_ACCESS_TOKEN
  , access_token_secret:  process.env.TWITTER_ACCESS_TOKEN_SECRET
})

var stream = twitter.stream('statuses/filter', { track: 'snowden' })

io.on('connect', function(socket){
  console.log('Someone has connected!')
  stream.on('tweet', function(tweet){
    var data = {}
    data.name = tweet.user.name
    data.screen_name = tweet.user.screen_name
    data.text = tweet.text
    data.user_profile_image = tweet.user.profile_image_url
    socket.emit('tweets', data)
  })
})