# Override the default adapter with the `DS.ActiveModelAdapter` which

EnglishLessons.AdminAdapter = DS.ActiveModelAdapter.extend
  headers: ( ->
    {
    "locale": ""
    }
  ).property().volatile()