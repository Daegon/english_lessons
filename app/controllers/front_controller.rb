class FrontController < ApplicationController

  def index
    EnglishLessons::Application.config.handlebars.templates_root = 'front/templates/'
  end
end
