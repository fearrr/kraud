class CallbacksController < ApplicationController
  def fast_callback
    phone_regex = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
    static_phone_regex = /\(?([0-9]{1})\)?([ .-]?)([0-9]{3})\2([0-9]{3})/

    if params[:name] != '' && params[:phone] != ''
      if params[:phone] =~ phone_regex || params[:phone] =~ static_phone_regex
        UserMailer.callback_email(params).deliver
        flash[:success] = "Запрос вызова отправлен, с Вами свяжутся в ближайшее время"
        redirect_to root_path
      else
        flash[:danger] = "Некорректный номер телефона"
        redirect_to root_path
      end
    else
      flash[:danger] = "Поля не могут быть пустыми"
      redirect_to root_path
    end
  end
end
