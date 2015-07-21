Ela.PagesIndexRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('datatablesUrl', @store.adapterFor('application').buildDatatablesURL('Page'))

Ela.PagesEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find('page', params.page_id)

Ela.PagesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('page')
