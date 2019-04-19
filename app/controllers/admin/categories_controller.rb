class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(name: :desc).all
  end
  #this will redirect them to the views folder and allow them to use the instance variable within "index"


  def new
    @category = Category.new
  end
    #this will redirect them to the views folder and allow them to use the instance variable within "category/New"
    # this instance variable is needed by the form

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categories created!'
    else
      render :new
    end
    #"ELSE" if the save wasnt successful then redirct back to the new "form" page (same page they are one)
  end

  private

  def categories_params
    params.require(:category).permit(
      :name
    )
    # The only thing you want to permit is them adding a new category so they only thing they should affect is  "NAME"
  end

end