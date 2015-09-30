var Car = function() {
  this.color = 'red';
  this.convertible = true;
  this.speed = 0;
  this.accelerate = function(change) {
    var newSpeed = this.speed + change;
    var result = "Old speed: " + this.speed + " New speed: " + newSpeed;
    speed = newSpeed;
    return result;
  }
}

myCar = new Car;
myCar.accelerate(10);
// console.log('myCar is:', myCar)

module.exports.myCar