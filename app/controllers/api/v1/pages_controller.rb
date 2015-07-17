module Api
  module V1
    class PagesController < ApiController
      include TranslationExtension
      model_object Page
      before_filter :find_model_object, :except => [:new, :create, :index, :datatables]

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
        I18n.available_locales.each do |locale|
          translation = @page.translation_for locale
          translation.attributes = translations_params[locale]
        end
        return render json: {errors: get_errors(@page)} unless @page.valid?
        @page.save
        render json: 'Ok!'
      end

      def update
        @page.attributes = page_params
        @page.set_translations translations_params
        return render json: 'Ok!' if @page.save
        render json: {errors: get_errors(@page)}
      end

      def datatables
        render json: PagesDatatable.new(view_context)
      end

      private

      def page_params
        params.require(:page).permit(:status, :position)
      end
    end
  end
end
