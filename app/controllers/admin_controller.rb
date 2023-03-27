class AdminController < ApplicationController
  before_action :require_user_logged_in

  def index
    @products = Product.all
  end
end
