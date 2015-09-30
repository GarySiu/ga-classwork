$(document).ready(function(){
  var socket = io('http://3c2c6a49.ngrok.io')
  var photoIds = []
  socket.on('connect', function(){
    console.log('Connected!')
  })

  socket.on('instagram', function(object){
    // console.log(object)
    $.ajax({
      url: 'https://api.instagram.com/v1/tags/' + object[0].object_id + '/media/recent?client_id=2255432d69cd46b0a7ece8e3ac9bc93a',
      dataType: 'jsonp'
    })
    .done(function(response){
      if(photoIds.indexOf(response.data[0].id) === -1){
        $('#photo-container').prepend('<li><img src="'+response.data[0].images.standard_resolution.url+'"></li>')
        photoIds.push(response.data[0].id)
        console.log(response.data[0].id)
      } else {
        console.log(response.data[0].id)
      }
    })
    .fail(function(error){
      console.log(error)
    })
    // $.get('https://api.instagram.com/v1/tags/' + object[0].object_id + '/media/recent', function(response){
    //   console.log(response)
    // })
  })
})