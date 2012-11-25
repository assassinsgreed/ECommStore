class BusinessInfosController < ApplicationController
  # GET /business_infos
  # GET /business_infos.json

  before_filter :require_sudo, :except => [:show]

  def index
    @business_infos = BusinessInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_infos }
    end
  end

  # GET /business_infos/1
  # GET /business_infos/1.json
  def show
    @business_info = BusinessInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_info }
    end
  end

  # GET /business_infos/new
  # GET /business_infos/new.json
  def new
    @business_info = BusinessInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_info }
    end
  end

  # GET /business_infos/1/edit
  def edit
    @business_info = BusinessInfo.find(params[:id])
  end

  # POST /business_infos
  # POST /business_infos.json
  def create
    @business_info = BusinessInfo.new(params[:business_info])

    respond_to do |format|
      if @business_info.save
        format.html { redirect_to @business_info, notice: 'Business info was successfully created.' }
        format.json { render json: @business_info, status: :created, location: @business_info }
      else
        format.html { render action: "new" }
        format.json { render json: @business_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_infos/1
  # PUT /business_infos/1.json
  def update
    @business_info = BusinessInfo.find(params[:id])

    respond_to do |format|
      if @business_info.update_attributes(params[:business_info])
        format.html { redirect_to @business_info, notice: 'Business info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_infos/1
  # DELETE /business_infos/1.json
  def destroy
    @business_info = BusinessInfo.find(params[:id])
    @business_info.destroy

    respond_to do |format|
      format.html { redirect_to business_infos_url }
      format.json { head :no_content }
    end
  end
end
