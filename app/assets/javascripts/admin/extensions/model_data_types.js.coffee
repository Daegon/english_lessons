DS.TranslationsTransform = DS.Transform.extend(
  deserialize: (serialized) ->
    console.log serialized
  serialize: (deserialized) ->
    console.log deserialized
)
Ela.register 'transform:translations', DS.TranslationsTransform