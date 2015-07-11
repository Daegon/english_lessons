module TranslationExtension
  def get_errors(model)
    errors = model.errors.messages
    errors.delete(:translations)
    errors.delete(:'translations.name')
    errors[:translations] = {}
    model.translations.each do |elem|
      next unless elem.locale == :translations || !elem.errors.messages.empty?
      errors[:translations][elem.locale] = elem.errors.messages
    end
    errors
  end

  def translations_params(resource_name = nil)
    parameters = {}
    EnglishLessons::Application.config.i18n.available_locales.each do |locale|
      parameters[locale] = model_object.translated_attribute_names
    end
    resource_name ||= model_object.name.underscore.to_sym
    params.require(resource_name).require(:translations).permit(parameters)
  end
end