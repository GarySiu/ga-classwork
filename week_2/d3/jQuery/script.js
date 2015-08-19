var myApp = {}

myApp.count = 0;
myApp.colors = ['red', 'orange', 'green', 'blue', 'purple', 'hotpink'];

myApp.disco = function(event){
  var listItems = $('li');
  for (var i = 0; i < myApp.colors.length; i++) {
    var index = (myApp.count + i) % myApp.colors.length;
    var listItem = listItems[i];
    $(listItem).css('background-color', myApp.colors[index]);
  };
  myApp.count++;
}

myApp.initialize = function() {
  $('button#disco-button').on('click', myApp.disco)
};

$(document).ready(function() {
  myApp.initialize();
})