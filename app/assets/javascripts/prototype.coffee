#= require handlebars

data = {}
data.searchResults = [
  {
    name: 'Ronnie Harrison'
    topics: ['JavaScript', 'Backbone', 'jQuery']
    location: 'Toronto'
  }
  {
    name: 'Pamela Cartee'
    topics: ['Sencha', 'PhoneGap']
    location: 'Toronto'
  }
  {
    name: 'Ramona Leclair'
    topics: ['node.js', 'socket.io']
    location: 'Toronto'
  }
  {
    name: 'Tim Kimball'
    topics: ['node.js', 'express', 'sails']
    location: 'New York City'
  }
  {
    name: 'Dorothea King'
    topics: ['jQurey UI', 'Dojo']
    location: 'San Francisco'
  }
]

$ ->
  if $('.search-results-container').length > 0 then $('.search-results-container').append Handlebars.compile($('#search-result').html())(data)
