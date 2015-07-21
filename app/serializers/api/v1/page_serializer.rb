module Api
  module V1
    class PageSerializer < ActiveModel::Serializer
      attributes :id, :name, :translit, :short_content, :content
      has_one :view
    end
  end
end

