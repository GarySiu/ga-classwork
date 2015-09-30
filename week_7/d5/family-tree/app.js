var express = require('express')
var app = express()
var port = process.env.PORT || 3000

var User = require('./models/users')

var mongoose = require('mongoose')
mongoose.connect('mongodb://localhost/family-tree')

// var tom = User({
//   firstName: 'Tom',
//   lastName: 'Wallace',
//   email: 'Tom@h.com'
// })

// tom.save(function(err){
//   if(err) console.log(err);
//   console.log('User has been created!');
// })

// var jen = User({
//   firstName: 'Jen',
//   lastName: 'Mah',
//   email: 'jenm@h.com'
// })

// jen.save(function(err){
//   if(err) console.log(err);
//   console.log('User has been created!');
// })

// User.find({}, function(err, users){
//   if(err) console.log(err)
//   console.log(users)
// })

User.find({lastName: 'Mah'}, function(err, user){
  if(err) console.log(err)
  console.log(user[0].sayHello())
})