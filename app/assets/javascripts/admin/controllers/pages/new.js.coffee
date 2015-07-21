Ela.PagesNewController = Ember.ObjectController.extend
  breadcrumb: ->
    I18n.t('pages.new')
  header: ->
    I18n.t('pages.new')
  actions:
    destroy: ->
      model = @get('model')
      model.deleteRecord()
      model.save()