class SessionsController < ApplicationController

  def create
    user = User.find_by(login_params)
    session[:user_id] = user.id
    render json: user, status: :ok
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

  private

  def login_params
    params.permit(:username)
  end

end
