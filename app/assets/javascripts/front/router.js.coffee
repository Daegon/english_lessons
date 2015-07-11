# For more information see: http://emberjs.com/guides/routing/

EnglishLessons.Router.map ()->
  @route 'pages', path: '/'

EnglishLessons.PagesRoute = Ember.Route.extend
  model: ->
    @store.find('page')