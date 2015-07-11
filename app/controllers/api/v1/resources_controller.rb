module Api
  module V1
    class ResourcesController < ApiController
      respond_to :json

      def get_meta
        meta = {}
        meta[:locales] = EnglishLessons::Application.config.i18n.available_locales
        meta[:resources] = {}
        Rails.application.config.editable_resources.each do |key, editable_resource|
          meta[:resources][key] = editable_resource.get_api_meta
        end
        render json: meta
      end
    end
  end
end
