# Override the default adapter with the `DS.ActiveModelAdapter` which

EnglishLessons.FrontAdapter = DS.ActiveModelAdapter.extend
  headers: ( ->
    {
    "locale": I18n.locale
    }
  ).property().volatile()