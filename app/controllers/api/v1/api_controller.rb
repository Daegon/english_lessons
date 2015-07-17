module Api
  module V1
    class ApiController < ApplicationController

      def find_model_object
        super
      rescue ActiveRecord::RecordNotFound
        render json: t('messages.not_found'), status: 404
      end
    end
  end
end
