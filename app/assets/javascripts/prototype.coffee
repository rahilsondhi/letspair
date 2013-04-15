#= require handlebars

data = {}
data.users = [
  {
    name: 'Ronnie Harrison Middle And Last Long Name'
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
  if $('.online-now').length > 0 then $('.online-now').append Handlebars.compile($('#online-now-row').html())(data)

  $('.js-open-user-modal').click ->
    # $('body').addClass 'noscroll' # Causes the screen size to change
    $('.large-modal-backdrop').addClass 'is-open'

  $('.large-modal-backdrop').on 'click', (e) ->
    if $(e.target).hasClass('large-modal-backdrop')
      # $('body').toggleClass 'noscroll', false # Causes the screen size to change
      $('.large-modal-backdrop').toggleClass 'is-open', false
