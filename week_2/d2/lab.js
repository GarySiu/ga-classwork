var foods = ["pizza", "tacos", "ice cream"];
foods.forEach(function(food){
  console.log("I like "+food);
});


var instructors = ['Jeremy', 'James', 'Lauren', 'Mathilda']
var output = instructors.map(function(name) {
  name = name.toUpperCase();
  name = name.split('').reverse().join('');
  return name;
});

var numbers = [7, 8,  3, 45,  67, 345,  23,  890, 675];
((numbers.reduce(function(a,b){return a+b;}))/numbers.length).toFixed(2);

var blocks = ["","#","#","#","#","#","#","#"]
var output = blocks.reduce(function(a,b){
  console.log(a+b);
  return a+b;
})

//Filter the array to contain only the numbers bigger than 53:
var numbers = [12, 5, 8, 130, 44];

numbers.filter(function(number){
  return number > 53;
})

//Double each number in the array and then sum every element in the array

var doubleNumbers = numbers.map(function(num){
 return num * 2;
});

doubleNumbers.reduce(function(a,b){
  return a + b;
})

