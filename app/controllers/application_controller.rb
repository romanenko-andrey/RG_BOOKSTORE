class ApplicationController < ActionController::Base
  require 'byebug'
  protect_from_forgery with: :exception
  before_action :set_categories

  private 
    def set_categories
      @categories = Category.pluck(:name)  
    end
end
