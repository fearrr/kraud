class ContactsController < ApplicationController
  def index
    @body = Contact.find(1)
  end

  def edit
    @body = Contact.find(params[:id])
  end

  def update
    @body = Contact.find(params[:id])
    if @body.update_attributes(contact_params)
      # Handle a successful update.
      flash[:success] = "Страница 'Контакты' обновлена"
      redirect_to contacts_url
    else
      render 'edit'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:body)
  end
end
