var LocalStrategy = require('passport-local').Strategy
var User = require('../models/user')

module.exports = function(passport){

  passport.serializeUser(function(user, callback){
    callback(null, user.id)
  })

  passport.deserializeUser(function(id, callback){
    User.findById(id, function(err, user){
      callback(err, user)
    })
  })

  passport.use('local-signup', new LocalStrategy({
    usernameField: 'email',
    passwordField: 'password',
    passReqToCallback: true
  }, function(req, email, password, callback){
    process.nextTick(function(){
      User.findOne({'local.email': email }, function(err, user){
        if(err) return callback(error)

        //if user exists with email address provided
      if(user) {
        return callback(null, false, req.flash('signupMessage', 'Email already taken.'))
      } else {
        //There is no user registered with the email provided
        var newUser = new User()
        newUser.local.email = email
        newUser.local.password = newUser.encrypt(password)

          newUser.save(function(err,user){
            if(err) throw err
            return callback(null, newUser)
          })
        }
      })
    })
  }))
}