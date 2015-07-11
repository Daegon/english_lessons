Ela.ResourcesController = Ember.ArrayController.extend
  breadcrumb: ->
    I18n.t 'pages.index'
  queryParams: ['resource']
