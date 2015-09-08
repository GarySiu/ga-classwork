var getRegionsButton;
var regionSelect;
var countrySelect;

function ajaxRequest(method, url) {

  var request = new XMLHttpRequest();
  request.open(method, url);
  request.send();

  return request;

}

function successfulRequest(request) {
  return request.readyState === 4 && request.statusText === 'OK';
}

function getRegions(e) {
  console.log('GET REGIONS!');
  var regions = [];
  var request  = ajaxRequest('GET', 'https://restcountries.eu/rest/v1/all');



  request.onreadystatechange = function() {
    // console.log(request.readyState);
    // console.log(request.statusText);
    regionSelect.innerHTML = '';

    if(successfulRequest(request)) {
      var response = JSON.parse(request.response);

      for(var i = 0; i < response.length; i++) {
        // console.log(response[i]);
        if(regions.indexOf(response[i].region) === -1 && response[i].region ) { // looking for countries without regions i.e. empty string
          regions.push(response[i].region);

          var optionRegion = document.createElement('option');
          optionRegion.setAttribute('value', response[i].region);
          optionRegion.innerHTML = response[i].region;
          regionSelect.appendChild(optionRegion);

        }
      }
      var optionDefault = document.createElement('option');
      optionDefault.setAttribute('value', 'default');
      optionDefault.innerHTML = '-- Please select a region --';
      regionSelect.insertBefore(optionDefault, regionSelect.firstChild);
    }
  }
}

function getCountries(e) {

  region = this.value;
  console.log('Hopefully get countries?!');
  var countries = [];
  var request = ajaxRequest('GET', 'https://restcountries.eu/rest/v1/region/' + region );

  request.onreadystatechange = function() {

    var response = JSON.parse(request.response);
    countrySelect.innerHTML = '';
    
    for(var i = 0; i < response.length; i++) {
      var optionCountry = document.createElement('option');
          optionCountry.setAttribute('value', response[i].name);
          optionCountry.innerHTML = response[i].name;
          countrySelect.appendChild(optionCountry);
    }
  }
}

function getCountryInfo(e) {
  var countryName = this.value;
  var request = ajaxRequest('GET', 'https://restcountries.eu/rest/v1/name/' + countryName)

  request.onreadystatechange = function () {

    if(successfulRequest(request)) {
      var response = JSON.parse(request.response)[0];
      var countryName = document.createElement('h2');
      
      var countryTemplate = '<h2>' + response.name + '</h2>';
      countryTemplate += '<h3>' + response.capital + '</h3>';
      results.innerHTML = countryTemplate;

    }

  }

}


document.addEventListener('DOMContentLoaded', function() {
  console.log('Hello World');

  getRegionsButton = document.getElementById('get-regions');
  regionSelect = document.getElementById('region-select');
  countrySelect = document.getElementById('country-select');
  results = document.getElementById('results');

  getRegionsButton.addEventListener('click', getRegions)
  regionSelect.addEventListener('change', getCountries)
  countrySelect.addEventListener('change', getCountryInfo)
});