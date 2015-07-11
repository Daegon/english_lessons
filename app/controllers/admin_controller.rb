class AdminController < ApplicationController
  layout 'admin'

  def index
    EnglishLessons::Application.config.handlebars.templates_root = 'admin/templates/'
  end
end