# for more details see: http://emberjs.com/guides/models/defining-models/

#data = {}
#['ua', 'en'].forEach (item, i, arr) ->
#  data['name_' + item] = DS.attr 'string'
#  data['translit_' + item] = DS.attr 'string'
#  data['short_content_' + item] = DS.attr 'string'
#  data['content_' + item] = DS.attr 'string'

Ela.Page = Ela.Model.extend {
  position: DS.attr 'number'
  translations: DS.attr()
}