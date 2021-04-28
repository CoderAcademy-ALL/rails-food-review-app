class UsersController < ApplicationController
  def index
  end

  def user_session
    user = User.find_by_full_name(params[:name])

    unless user.nil?
      session[:user_id] = user.id
      redirect_to products_path
    else
      flash[:error] = "#{params[:name]} does not exists"
      redirect_to users_path
    end
    
  end
end
