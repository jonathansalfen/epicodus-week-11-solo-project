class ProductsController < ApplicationController

  def index
    # Code for listing all products goes here.
    @products = Product.all
    render :index
  end

  def new
    # Code for new product form goes here.
    @product = Product.new
    render :new
  end

  def create
    # Code for creating a new product goes here.
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    # Code for edit product form goes here.
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single product goes here.
    @product = Product.find(params[:id])
    render :show
  end

  def update
    # Code for updating an product goes here.
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an product goes here.
    @product = Product.find(params[:id])
    @product.destory
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:cost, :country_of_origin, :grocery_category, :name)
  end

end