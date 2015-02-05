class SessionsController < ApplicationController
  def new
  end
  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      # Log the admin in and redirect to the admin's show page.
      log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      flash.now[:success] = 'Вы вошли как администратор'
      # redirect_back_or admin
      redirect_to root_path
    else
      # Create an error message.
      flash.now[:danger] = 'Неверный пароль/логин' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
