class UserMailer < ActionMailer::Base
  # Default Mail Values
  default from: 'D7235200@yandex.ru'

  def callback_email(user)
    @user = user
    email_with_name = "D7235200@yandex.ru"
    mail(to: email_with_name, subject: "Заявка на обратный звонок от пользователя #{@user[:name]}")
  end

  def callback_from_contacts(user)
    @user=user
    email_with_name = "D7235200@yandex.ru"
    mail(to: email_with_name, subject: "Вопрос от пользователя #{@user[:name]}")
  end
end
