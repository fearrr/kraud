class CallbacksController < ApplicationController
  def fast_callback
    if params[:name] == ''
      flash[:danger] = "Заполните поле 'ФИО'"
      redirect_to request.referer
    elsif params[:phone] == ''
      flash[:danger] = "Заполните поле 'Телефон'"
      redirect_to request.referer
    elsif params[:region] == ''
      flash[:danger] = "Заполните поле 'Регион'"
      #elsif params[:phone] !=~/^(0|[1-9][0-9]*)$/
      # flash[:danger] = "Введите корректный телефон"
      #redirect_to request.referer
    else
      UserMailer.callback_email(params).deliver
      flash[:success] = "Запрос вызова отправлен, с Вами свяжутся в ближайшее время"
      redirect_to root_path
    end
  end

  def slow_callback
    UserMailer.callback_from_contacts(params).deliver
    flash[:success] = "Запрос вызова отправлен, с Вами свяжутся в ближайшее время"
    redirect_to contacts_path
  end
end
