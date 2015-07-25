# for more details see: http://emberjs.com/guides/models/defining-models/

#data = {}
#['ua', 'en'].forEach (item, i, arr) ->
#  data['name_' + item] = DS.attr 'string'
#  data['translit_' + item] = DS.attr 'string'
#  data['short_content_' + item] = DS.attr 'string'
#  data['content_' + item] = DS.attr 'string'

Ela.Model = DS.Model.extend {
  didLoad: ->
    translations = @get('translations')
    console.log translations
    if translations?
      translations = translations[I18n.locale]
      if translations?
        $.each translations, (key, val)=>
          @set(key, val)
}