// console.log('Hello world');
var endpoint = 'http://api.doughnuts.ga/doughnuts';

$(document).ready(function() {
  $('#new-doughnut').on('submit', addDoughnut);
  $('body').on('click', '.delete', deleteDoughnut);
  getDoughnuts();
})

function addDoughnut(e) {
  e.preventDefault(); //event.preventDefault(); works fine if you don't pass in e

  var doughnut = {
    style: $('#doughnut-style').val(),
    flavor: $('#doughnut-flavour').val()
  };

  $.post(endpoint, doughnut)
  .done(function(response) {
    appendDoughnut(response);
    $('#doughnut-flavour').val('');
  })
}

function getDoughnuts() {
  $.ajax({
    url: endpoint
  })
  .done(function(response) {
    $.each(response, function(index, doughnut) {
      appendDoughnut(doughnut)
    })
  })
}

function appendDoughnut(doughnut) {
  $('#doughnuts').prepend('<li>' + doughnut.flavor + ' <em>' + doughnut.style + '</em> <a class="delete" href="#" data-id="' +  doughnut.id + '">delete</a></li>')
}

function deleteDoughnut(e) {
  // console.log('deleted the doughnut');
  console.log($(this).data('id'));

  var element = $(this);

  $.ajax({
    url: endpoint + '/' + $(this).data('id'),
    method: 'delete'
  })
  .done(function(response) {
    console.log('success');
    console.log(response);
    element.parent().remove();
  })
  .fail(function(err) {
    console.log('error')
    console.log(err);
  })
}