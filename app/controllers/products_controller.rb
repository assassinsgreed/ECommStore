class ProductsController < ApplicationController
  #Require admin login except for index and shows.
  before_filter :require_sudo, :except => [:index, :show]
  
  # GET /products
  # GET /products.json
  def index
    #Checking for a category
    if params[:category].present?
      if params[:category] == "Gold"
        @products = Product.where('category_id = 1').order("id desc")
      elsif params[:category] == "Gems"
        @products = Product.where('category_id = 2').order("id desc")
      elsif params[:category] == "Lost Artifacts"
        @products = Product.where('category_id = 3').order("id desc")
      elsif params[:category] == "Relics"
        @products = Product.where('category_id = 4').order("id desc")
      else
        @products = Product.where('category_id = 5').order("id desc")
      end
    #Checking for a status
    elsif params[:status].present?
      if params[:status] == "Sale"
        @products = Product.where('sale_price not null').order("id desc")
      elsif params[:status] == "New"
        @products = Product.where(:created_at => 7.days.ago..DateTime.now).order("id desc")
      elsif params[:status] == "Updated"
        @products = Product.where(:updated_at => 7.days.ago..DateTime.now).order("id desc")
      end
    #Load page like normal
    else
      @products = Product.order("id desc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @review  = @product.reviews.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @categories = Category.order(:name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @categories = Category.order(:name)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def search_results
    @keywords = params[:keywords]
    @products = Product.where('name LIKE ?', "%#{@keywords}%").order("id desc")
  end
end
