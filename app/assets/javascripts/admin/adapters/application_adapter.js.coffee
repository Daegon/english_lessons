# Override the default adapter with the `DS.ActiveModelAdapter` which

Ela.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1',
  headers: ( ->
    {
    "locale": ""
    }
  ).property().volatile()