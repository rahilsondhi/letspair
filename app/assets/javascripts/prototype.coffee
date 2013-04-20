#= require handlebars

Handlebars.registerHelper "join", (items, block) ->
  delimiter = block.hash.delimiter or ","
  start = start = block.hash.start or 0
  len = (if items then items.length else 0)
  end = block.hash.end or len
  out = ""
  end = len  if end > len
  if "function" is typeof block
    i = start
    while i < end
      out += delimiter  if i > start
      if "string" is typeof items[i]
        out += items[i]
      else
        out += block(items[i])
      i++
    out
  else
    [].concat(items).slice(start, end).join delimiter


data = {}
data.users = [
  {
    name: 'Ronnie Harrison'
    topics: ['JavaScript', 'Backbone', 'jQuery']
    location: 'Toronto'
    sessionDate: 'Sat, Apr 13, 2013'
    sessionDirection: 'outgoing'
    message: 'So pumped!'
  }
  {
    name: 'Pamela Cartee'
    topics: ['Sencha', 'PhoneGap']
    location: 'Toronto'
    sessionDate: 'Sun, Apr 14, 2013',
    sessionDirection: 'incoming'
    message: 'Cool, sounds like a plan. Looking forward to it!'
  }
  {
    name: 'Ramona Leclair'
    topics: ['node.js', 'socket.io']
    location: 'Toronto'
    sessionDate: 'Mon, Apr 15, 2013',
    sessionDirection: 'incoming'
    message: 'I might as well join too...'
  }
  {
    name: 'Tim Kimball'
    topics: ['node.js', 'express', 'sails']
    location: 'New York City'
    sessionDate: 'Tues, Apr 16, 2013',
    sessionDirection: 'incoming'
  }
  {
    name: 'Dorothea King'
    topics: ['jQurey UI', 'Dojo']
    location: 'San Francisco'
    sessionDate: 'Wed, Apr 17 2013',
    sessionDirection: 'scheduled'
  }
]

$ ->
  if $('.search-results-container').length > 0 then $('.search-results-container').append Handlebars.compile($('#search-result').html())(data)
  if $('.online-now').length > 0 then $('.online-now').append Handlebars.compile($('#online-now-row').html())(data)
  if $('.session-list').length > 0 then $('.session-list').append Handlebars.compile($('#session').html())(data)
  if $('.chat-message-list').length > 0 then $('.chat-message-list').append Handlebars.compile($('#chat-message').html())(data)

  #
  # Clicking on a user modal
  #
  $('.js-open-user-modal').click ->
    $('body').addClass 'noscroll' # Causes the screen size to change
    $('.large-modal-backdrop').addClass 'is-open'

  $('.large-modal-backdrop').on 'click', (e) ->
    if $(e.target).hasClass('large-modal-backdrop')
      $('body').toggleClass 'noscroll', false # Causes the screen size to change
      $('.large-modal-backdrop').toggleClass 'is-open', false

  #
  # Request to Pair
  #
  $('.js-select2-tokens').select2 tags:[], tokenSeparators: [",", " "]
  $('.js-select2').select2()
  $('[name^="suggested-date-"]').datepicker
    showAnim: ''
    minDate: 0

  #
  # My Sessions
  #

