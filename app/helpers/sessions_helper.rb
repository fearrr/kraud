module SessionsHelper
  # Logs in the given admin.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Remembers a user in a persistent session.
  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  # Returns the admin corresponding to the remember token cookie.
  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif (admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id: admin_id)
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  # Returns true if the given user is the current user.
  def current_admin?(admin)
    admin == current_admin
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_admin.nil?
  end

  # Forgets a persistent session.
  def forget(admin)
    admin.forget
    cookies.delete(:admin_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
