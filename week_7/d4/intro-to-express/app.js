var express = require('express');
var app     = express();
var port    = process.env.PORT || 3000;
var bodyParser = require('body-parser')

var router = express.Router();
var videoRouter = express.Router();

app.set('views', './views')
app.set('view engine', 'ejs')
app.use(bodyParser.urlencoded({extended: false}))

// Middleware logging functionality
app.use(function(req, res, next) {
  // console.log(req.method + ' request to ' + req.url + ' from ' + req.ip);
  console.log('%s request to %s from %s', req.method, req.url, req.ip);
  next()
})

router.get('/', function(req,res) {
  res.send("Welcome");
})

router.get('/about', function(req, res) {
  res.send("About!");
})

router.get('/contact', function(req, res) {
  res.send("Contact?");
})

app.use('/useful-info/', router);

//            Video router             \\
// INDEX
videoRouter.get('/', function(req,res) {
  // res.render('index', { header: 'index!'} )
  res.json([
    {
      "id": 1, "title": "jaws"
    },
    {
      "id": 2, "title": "Royale with Cheese"
    }
  ])
})

// SHOW
videoRouter.get('/:id', function(req,res) {
  console.log(req.params)
  console.log(req.body)
  res.render('show', { header: 'show!'})
})

// NEW
videoRouter.get('/new', function(req,res) {
  
})

// CREATE
videoRouter.post('/', function(req,res) {
  console.log(req.params)
  console.log(req.body)
})

// EDIT
videoRouter.get('/:id/edit', function(req,res) {
  
})

// UPDATE
videoRouter.put('/:id', function(req,res) {
  
})
// DELETE
videoRouter.delete('/:id', function(req,res) {
  
})

app.use('/videos', videoRouter);

app.listen(port, function() {
  console.log('Server started on ' + port);
});