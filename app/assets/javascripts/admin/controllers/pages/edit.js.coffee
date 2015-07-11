Ela.PagesEditController = Ember.ObjectController.extend
  breadcrumb: ->
    @get 'model.name_ua'
  header: ->
    @get 'model.name_ua'
  actions:
    save: ->
      @get('model').save()
