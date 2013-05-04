#= require foundation
#= require select2.min

#= require handlebars.runtime
#= require underscore-min
#= require backbone-min
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
Pair.Routers = {}
Pair.Controllers = {}

#
# Models
#

Pair.Models.User = Backbone.Model.extend()

#
# Templates
#

Pair.Views.Registration.Step1 = Backbone.Marionette.ItemView.extend
  template: 'application/main/templates/views/registration/step1'

#
# Controllers
#

Pair.Controllers.Registration = Marionette.Controller.extend
  step1: ->
    step1 = new Pair.Views.Registration.Step1 model: Pair.pendingUser
    Pair.globalContentContainer.show(step1)

#
# Routers
#

Pair.Routers.Registration = Backbone.Marionette.AppRouter.extend
  controller: new Pair.Controllers.Registration
  appRoutes:
    'register/step1': 'step1'

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

# Backbone.history
Pair.on 'initialize:after', (options) ->
  Backbone.history?.start? pushState: true

#
# Backbone partial that goes in application layout?
#

$ ->
  Pair.start()
