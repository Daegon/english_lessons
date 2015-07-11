module Api
  module V1
    class PagesController < ApiController
      include TranslationExtension
      respond_to :json
      model_object Page
      before_filter :find_model_object, :except => [:new, :create, :index]

      def index
        @pages = Page.all
        return render json: @pages, each_serializer: PageMultiLangSerializer if request_locale.blank?
        render json: @pages
      end

      def show
        return render json: @page, serializer: PageMultiLangSerializer, root: :pages if request_locale.blank?
        render json: @page
      end

      def create
        @page = Page.new(page_params)
        @page.set_translations translations_params
        if @page.valid?
          render json: Page.save
        end
        render json: @page.errors.messages
      end

      def update
        @page.attributes = page_params
        @page.set_translations translations_params
        if @page.save
          render json: 'Ok!'
        else
          render json: {errors: get_errors(@page)}
        end
      end

      def page_params
        params.require(:page).permit(:status, :position)
      end
    end
  end
end
