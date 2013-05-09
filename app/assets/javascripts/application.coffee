#= require foundation
#= require select2.min
#= require spin.min

#= require handlebars.runtime
#= require underscore-min
#= require backbone-min
#= require backbone_rails_sync
#= require backbone.marionette
#= require backbone-renderer
#= require backbone-validation-min

#= require_tree ./application/

#
# Base file
#

window.Pair = new Backbone.Marionette.Application()
Pair.Models = {}
Pair.Views = {}
Pair.Views.Registration = {}
Pair.Views.Needs = {}
Pair.Routers = {}
Pair.Controllers = {}
Pair.Helpers = {}

#
# Backbone Validation
#

# Global Backbone Validation callbacks
_.extend Backbone.Validation.callbacks,
  valid: (view, attr, selector) ->
    view.ui[attr].removeClass 'error'
    view.$('.js-error-list').find("""li[data-attr="#{attr}"]""").remove()

  # This assumes the view has a ui hash for this attr
  invalid: (view, attr, error, selector) ->
    # Mark one field as invalid
    view.ui[attr].addClass 'error'

    # Set up a list of errors
    unless view.$('.js-error-list').length
      view.$('.js-error-list-container').append('<div class="alert-box alert js-error-list"><ul class="disc"></ul></div>')

    # Make a list item for this attr
    unless view.$('.js-error-list').find("""li[data-attr="#{attr}"]""").length
      view.$('.js-error-list ul').append("""<li data-attr="#{attr}"></li>""")
    view.$('.js-error-list').find("""li[data-attr="#{attr}"]""").text(error)


#
# Models
#

Pair.Models.User = Backbone.Model.extend
  url: '/users'

  validation:
    username: [
      {required: true},
      {maxLength: 40},
      {pattern: /^[a-zA-Z0-9_]*$/, msg: 'Username can only contain letters, numbers, and underscores.'}
    ]
    name: [
      {required: true},
      {maxLength: 255}
    ]
    email: [
      {required: true},
      {pattern: 'email'}
    ]
    location:
      required: true
    timezone:
      required: true

Pair.Models.Need = Backbone.Model.extend
  url: '/needs'
  defaults:
    date_type: 'ongoing'

  validation:
    topic_ids: [
      {required: true}
    ]
    description: [
      {required: true}
    ]

#
# Views
#

Pair.Views.Registration.Step1 = Backbone.Marionette.ItemView.extend
  template: 'application/main/templates/views/registration/step1'

  templateHelpers: ->
    timezones: Pair.Helpers.Timezones

  events:
    'submit' : 'save'

  modelEvents:
    'validated:valid' : 'valid'
    'sync:start' : 'loading'
    'sync' : 'success'
    'error' : 'error'

  ui:
    username: 'input[name="username"]'
    name: 'input[name="name"]'
    email: 'input[name="email"]'
    location: 'input[name="location"]'
    timezone: 'select[name="timezone"]'
    topic_ids: 'input[name="topic_ids"]'
    actions: '.js-actions'

  onRender: ->
    Backbone.Validation.bind(@)

  onShow: ->
    # TODO: This should be abstracted out into something reusable
    @ui.topic_ids.select2
      minimumInputLength: 1
      tags:[]
      tokenSeparators: [",", " "]
      ajax:
        url: '/topics/search'
        data: (term, page) -> {q: term}
        results: (data, page) -> {results: data}
      formatResult: (result) -> result.title
      formatSelection: (result) -> result.title

  valid: ->
    @$('.js-error-list').remove()

  loading: ->
    # TODO: disable form submission
    @ui.actions.spin left: 150, lines: 8, length: 4, width: 3, radius: 5

  error: ->
    # TODO: Improve handling of server side error
    @ui.actions.spin(false)

  success: ->
    # TODO: Transition to step2
    @ui.actions.spin(false)
    Pair.needsRouter.navigate '/post-a-need', trigger: true

  save: (e) ->
    e.preventDefault()
    data =
      username: @ui.username.val()
      name: @ui.name.val()
      email: @ui.email.val()
      location: @ui.location.val()
      timezone: @ui.timezone.val()
      topic_ids: @ui.topic_ids.val()
    @model.set(data)
    if @model.isValid(true) then @model.sync('create', @model, {})

Pair.Views.Needs.NewNeed = Backbone.Marionette.ItemView.extend
  template: 'application/main/templates/views/needs/new_need'

  events:
    'submit' : 'save'
    'click [data-need-date-type]' : 'selectNeedDateType'

  modelEvents:
    'sync:start' : 'loading'
    'sync' : 'success'
    'error' : 'error'
    'validated:valid' : 'valid'
    'change:date_type' : 'dateTypeChanged'

  ui:
    actions: '.js-actions'
    topic_ids: 'input[name="topic_ids"]'
    needDateTypes: '[data-need-date-type]'
    description: '[name="description"]'
    suggestedDates: '.js-suggested-dates'
    suggestedDate1: '[name="suggested-date-1"]'
    suggestedDate2: '[name="suggested-date-2"]'
    suggestedDate3: '[name="suggested-date-3"]'

  initialize: ->
    @model = new Pair.Models.Need

  onRender: ->
    Backbone.Validation.bind(@)

  onShow: ->
    # TODO: This should be abstracted out into something reusable
    @ui.topic_ids.select2
      minimumInputLength: 1
      tags:[]
      tokenSeparators: [",", " "]
      ajax:
        url: '/topics/search'
        data: (term, page) -> {q: term}
        results: (data, page) -> {results: data}
      formatResult: (result) -> result.title
      formatSelection: (result) -> result.title

    @$('[name^="suggested-date-"]').datepicker
      showAnim: ''
      minDate: 0

  valid: ->
    # TODO: Do validation for new need

  loading: ->
    # TODO: disable form submission
    @ui.actions.spin lines: 8, length: 4, width: 3, radius: 5

  error: ->
    # TODO: Improve handling of server side error
    @ui.actions.spin(false)

  success: ->
    # TODO: Move to /my-needs
    @ui.actions.spin(false)
    console.log "Success, move to /my-needs"

  selectNeedDateType: (e) ->
    # Remove is-active from all types
    @ui.needDateTypes.removeClass 'is-active'

    # Mark this type as active
    $target = @$(e.currentTarget)
    @model.set 'date_type', $target.data 'need-date-type'
    $target.addClass 'is-active'

  dateTypeChanged: ->
    @ui.suggestedDates.toggle @model.get('date_type') is 'specific'

  save: (e) ->
    e.preventDefault()
    data =
      topic_ids: @ui.topic_ids.val()
      description: @ui.description.val()
      date_suggested_one: @ui.suggestedDate1.val()
      date_suggested_two: @ui.suggestedDate2.val()
      date_suggested_three: @ui.suggestedDate3.val()
    @model.set(data)
    if @model.isValid(true) then @model.sync('create', @model, {})

#
# Controllers
#

Pair.Controllers.Registration = Marionette.Controller.extend
  step1: ->
    step1 = new Pair.Views.Registration.Step1 model: Pair.pendingUser
    Pair.globalContentContainer.show(step1)

Pair.Controllers.Needs = Marionette.Controller.extend
  newNeed: ->
    newNeed = new Pair.Views.Needs.NewNeed
    Pair.globalContentContainer.show(newNeed)

#
# Routers
#

Pair.Routers.Registration = Backbone.Marionette.AppRouter.extend
  controller: new Pair.Controllers.Registration
  appRoutes:
    'register/step1': 'step1'

Pair.Routers.Needs = Backbone.Marionette.AppRouter.extend
  controller: new Pair.Controllers.Needs
  appRoutes:
    'post-a-need': 'newNeed'

#
# In the base file
#

# Initialize regions
Pair.addInitializer ->
  Pair.addRegions
    headerContainer: '.header-container'
    globalContentContainer: '.global-content-container'

# Initialize routers
Pair.addInitializer ->
  @registrationRouter = new Pair.Routers.Registration
  @needsRouter = new Pair.Routers.Needs

# Backbone.history
Pair.on 'initialize:after', (options) ->
  Backbone.history?.start? pushState: true

#
# Backbone partial that goes in application layout?
#

$ ->
  Pair.start()
