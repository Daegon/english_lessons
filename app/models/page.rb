class Page < ActiveRecord::Base
  translates :name, :translit, :short_content, :content, :meta_title, :meta_keywords, :meta_description
  belongs_to :view

  globalize_accessors accept_blank: true
  accepts_nested_attributes_for :translations
  validates_associated :translations

  validates_presence_of :position, presence: true
  validates_numericality_of :position, only_integer: true
  translation_class.validates_presence_of :name

  # after_create :create_translations

  def self.get_api_meta
    {
        attributes: [
            {
                name: :status,
                type: :boolean
            },
            {
                name: :position,
                type: :integer
            },
            {
                name: :name,
                multilang: true,
                type: :string
            },
            {
                name: :content,
                multilang: true,
                type: :wysiwyg
            },
        ]
    }
  end
end
