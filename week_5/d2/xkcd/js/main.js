$(document).ready(function() {
  // console.log('Hello Randall');
  results = $('#results');
  buttonContainer = $('#button-container');
  var today = new Date();
  var year = today.getFullYear();

  for (i = 2006; i <= year; i++) {
    buttonContainer.append('<button>' + i + '</button>')
  }

  buttonContainer.children().on('click', function() { request($(this).html() ) });
  
  request = function(year) {

    $.ajax({

      url: 'http://xkcd-unofficial-api.herokuapp.com/xkcd?year=' + year,

      data: {
        api_key: 'foobar'
      }
    }).done(function(data){
      console.log(data)
      render(data);
    })    
  }

  render = function(data) {
    results.empty();
    $.each(data, function(i, e) {
      result = '<h2>' + e.safe_title + '</h2>'
      result += '<div><img src=" ' + e.img + '" title="' + e.alt + '" ></div>'
      results.append(result)
    });
  }

})