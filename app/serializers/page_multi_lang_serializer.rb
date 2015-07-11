class PageMultiLangSerializer < ActiveModel::Serializer
  attributes :id
  has_one :view

  def attributes
    data = super
    data[:translations] = {}
    I18n.available_locales.each do |locale|
      data[:translations][locale] = {}
      [:name, :translit, :short_content, :content].each do |field|
        data[:translations][locale][field] = object.translation_for(locale).send(field)
      end
    end
    data
  end
end
