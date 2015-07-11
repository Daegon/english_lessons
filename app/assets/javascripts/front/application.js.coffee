#= require jquery
#= require jquery_ujs
#= require ember
#= require ember-data
#= require i18n
#= require ./translations
#= require_self
#= require ./english_lessons

# for more details see: http://emberjs.com/guides/application/
window.EnglishLessons = Ember.Application.create
  baseURL: '/front'

EnglishLessons.initializer
  name: "locale",
  initialize: (container, application) ->
    I18n.locale = 'ua'

Ember.Handlebars.registerHelper 'i18n', (property, options) ->
  params = options.hash
  self = this
  # Support variable interpolation for our string
  Object.keys(params).forEach (key) ->
    params[key] = Em.Handlebars.get(self, params[key], options)
    return
  I18n.t property, params