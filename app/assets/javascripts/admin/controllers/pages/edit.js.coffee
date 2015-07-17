Ela.PagesEditController = Ember.ObjectController.extend
  breadcrumb: ->
    @get 'model.name'
  header: ->
    @get 'model.name'
  actions:
    save: ->
      @get('model').save()
