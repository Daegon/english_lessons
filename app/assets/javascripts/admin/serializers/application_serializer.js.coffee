# Override the default adapter with the `DS.ActiveModelAdapter` which

Ela.ApplicationSerializer = DS.ActiveModelSerializer.extend
  extractSingle: (store, primaryType, rawPayload, recordId) ->
    typeKey = primaryType.typeKey
    payload[typeKey] = payload[Ember.get('Ela.currentResource')]
    delete payload[Ember.get('Ela.currentResource')]
    @_super store, primaryType, rawPayload, recordId
  extractArray: (store, primaryType, payload) ->
    pluralTypeKey = Ember.Inflector.inflector.pluralize(primaryType.typeKey)
    payload[pluralTypeKey] = payload[Ember.get('Ela.currentResource')]
    delete payload[Ember.get('Ela.currentResource')]
    @_super store, primaryType, payload