class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update]
  before_action :correct_admin, only: [:edit, :update]

  def new
    @admin = Admin.new()
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      # Handle a successful save.
      log_in @admin
      flash[:success] = "Вы зашли как администратор"
      # redirect_to @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      # Handle a successful update.
      flash[:success] = "Профиль администратора изменен"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  # Confirms a logged-in admin.
  def logged_in_admin
    unless logged_in?
      store_location
      flash[:danger] = "Войдите как администратор"
      redirect_to login_url
    end
  end

  # Confirms the correct admin.
  def correct_admin
    @admin = Admin.find(params[:id])
    redirect_to(root_url) unless current_admin?(@admin)
  end

end
