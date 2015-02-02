class ContactsController < ApplicationController
  def index
    @global = Global.first
  end
end
