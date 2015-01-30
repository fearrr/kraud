class CallbacksController < ApplicationController
  def fast_callback
    UserMailer.callback_email(params).deliver
    flash[:success] = "Запрос вызова отправлен, с Вами свяжутся в ближайшее время"
    redirect_to root_path
  end

  def slow_callback
    UserMailer.callback_from_contacts(params).deliver
    flash[:success] = "Запрос вызова отправлен, с Вами свяжутся в ближайшее время"
    redirect_to contacts_path
  end
end
