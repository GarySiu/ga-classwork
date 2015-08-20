var posX = 0;
var direction = 'left';
var walkingsrc = "http://www.anniemation.com/clip_art/images/cat-walk.gif";
var dancingsrc = "http://rs273.pbsrc.com/albums/jj227/rockygirlcat/Vehicles%20Dancing%20Animations/catbikini.gif~c200";
var startRunning = function() {
  var movingCat = setInterval(moveKitty, 50);
}
var moveKitty = function() {
  if (direction === 'left') {
    $('img').css({'position': 'absolute', 'left': posX});
    posX += 10;
    posX >= $(window).width() ? direction = 'right' : direction = 'left';
  }
  if (direction === 'right') {
    $('img').css({'position': 'absolute', 'left': posX});
    posX -= 10;
    posX >= 0 ? direction = 'right' : direction = 'left';
  }
  // if (posX >= $(window).width() / 2) {
  //   $('img').attr('src', walkingsrc);
  //   // setTimeout($('img').attr('src', wasrc), 10000);
  // }
}
$(document).ready(startRunning);