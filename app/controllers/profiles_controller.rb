class ProfilesController < ApplicationController
  def show
  	@user = User.where(username: params[:username]).first
  	@products = @user.products
  end
end
