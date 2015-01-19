class TypesController < ApplicationController
  def new
    @type = Type.new
  end
  def create
    @type = Type.new(types_params)
    if @type.save
      # Handle a successful save.
      flash[:success] = "Категория добавлена"
      redirect_to items_url
    else
      render 'new'
    end
  end
end
private
def types_params
  params.require(:type).permit(:title, :section_name)
end
