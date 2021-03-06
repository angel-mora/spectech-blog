class SessionsController < ApplicationController
  def index; end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      flash[:notice] = 'You have signed in!'
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to articles_path
    else
      flash[:alert] = 'No User found. Please sign up'
      redirect_to new_user_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
