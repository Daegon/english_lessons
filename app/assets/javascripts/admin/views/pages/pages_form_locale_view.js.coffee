# for more details see: http://emberjs.com/guides/views/

Ela.PagesFormLocaleView = Ember.View.extend
  templateName: 'pages/form/locale'
  locale: null
  translations: ->
    model = @get('model')
    console.log model.translations[@locale]
