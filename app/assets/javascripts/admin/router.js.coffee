# For more information see: http://emberjs.com/guides/routing/

Ember.Route.reopen
  beforeModel: (transition) ->
    if transition.queryParams? && transition.queryParams.resource?
      Ember.set('Ela.currentResource', transition.queryParams.resource)
      Ela.ResourceAdapter = Ela.ApplicationAdapter.extend
        pathForType: (type)->
          Ember.String.underscore transition.queryParams.resource
      data = {}
      metaData = Ember.get('Ela.metaData')
      console.log metaData
      $.each metaData.resources, (resource_name, resource_meta) ->
        $.each resource_meta.attributes, (index, attribute) ->
          type = attribute.type
          if attribute.multilang
            type = 'multilang' + '_' + attribute.type
          data[resource_name] = DS.attr 'string'
      Ela.Resource = DS.Model.extend data
    return

Ela.Router.map ()->
  @resource 'resources', ->
    @route 'new'
    @route 'edit', {path: ':resource_id'}

Ela.ResourcesIndexRoute = Ember.Route.extend
  model: ->
    @store.find('resource')

Ela.PagesEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find('resource', params.resource_id)

Ela.PagesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('resource')
