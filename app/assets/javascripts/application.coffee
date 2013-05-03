#= require foundation
#= require select2.min

#= require handlebars.runtime
#= require underscore-min
#= require backbone-min
#= require backbone.marionette
#= require backbone-renderer
#= require backbone-validation-min

#= require_tree ./application/

window.Pair = new Backbone.Marionette.Application()
Pair.Models = {}
Pair.Views = {}
Pair.Views.Registration = {}

Pair.Models.User = Backbone.Model.extend()

Pair.Views.Registration.Step1 = Backbone.Marionette.ItemView.extend
  template: 'application/main/templates/views/registration/step1'

Pair.addRegions
  headerContainer: '.header-container'
  globalContentContainer: '.global-content-container'

$ ->
  Pair.start()
