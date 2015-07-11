# for more details see: http://emberjs.com/guides/models/defining-models/

data = {}
['ua', 'en'].forEach (item, i, arr) ->
  data['name_' + item] = DS.attr 'string'
  data['translit_' + item] = DS.attr 'string'
  data['short_content_' + item] = DS.attr 'string'
  data['content_' + item] = DS.attr 'string'

EnglishLessons.Page = DS.Model.extend data