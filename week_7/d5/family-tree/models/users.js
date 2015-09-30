var mongoose = require('mongoose');

var userSchema = new mongoose.Schema({
  firstName: String,
  lastName: String,
  email: { type: String, required: true, unique: true },
  meta: {
    age: Number,
    website: String,
    gitgub: String
  },
  createdAt: Date,
  updatedAt: Date
})

userSchema.methods.sayHello = function(){
  return 'Hello ' + this.firstName
}

var User = mongoose.model('User', userSchema)

module.exports = User;