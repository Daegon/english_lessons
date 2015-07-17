# For more information see: http://emberjs.com/guides/routing/

Ela.Router.map ()->
  @resource 'pages', ->
    @route 'new'
    @route 'edit', {path: ':page_id'}

Ela.PagesIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('page')
  setupController: (controller)->
    controller.set('datatablesUrl', @store.adapterFor('application').buildDatatablesURL('Page'))

Ela.PagesEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find('page', params.page_id)

Ela.PagesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('page')
