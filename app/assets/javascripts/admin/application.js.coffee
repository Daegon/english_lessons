#= require handlebars
#= require jquery2
#= require jquery_ujs
#= require ember
#= require ember-data
#= require i18n
#= require ./translations
#= require_self
#= require ./english_lessons
#= require twitter/bootstrap
#= require ../bootstrap
#= require ./lib/AdminLTE/app.js

# for more details see: http://emberjs.com/guides/application/
window.Ela = Ember.Application.create
  ready: ->
    Ember.$('body').addClass('skin-blue sidebar-mini');

Ela.initializer
  name: "locale",
  initialize: (container, application) ->
    I18n.locale = 'ua'
    Ela.deferReadiness()
    $.getJSON '/api/v1/resources/get_meta', (config)->
      Ember.set('Ela.metaData', config)
      Ember.set('Ela.currentResource', null)
      Ela.advanceReadiness()


Ember.Handlebars.registerHelper 'i18n', (property, options) ->
  params = options.hash
  self = this
  # Support variable interpolation for our string
  Object.keys(params).forEach (key) ->
    params[key] = Em.Handlebars.get(self, params[key], options)
    return
  I18n.t property, params