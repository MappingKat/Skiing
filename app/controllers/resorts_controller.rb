class ResortsController < ApplicationController
  
  def index
    @resorts = Resort.all
  end

  # def new
  #   @resort = Resort.new
  # end

  # def create 
  #   @resort = Resort.new(params[:resort])

  #   respond_to do |format|
  #     if @resort.save
  #       format.html { redirect_to @resort, notice: 'Resort was successfully created.' }
  #     else
  #       format.html { render action: 'new'}
  #     end
  #   end
  # end

  def show
    @resort = Resort.find(params[:id])
  end

  # def destroy
  #   @resort = Resort.find(params[:id])
  #   @resort.destroy
  #   redirect_to(resorts_path)
  # end

  # def edit
  #   @resort = Resort.find(params[:id])
  # end

  # def update
  #   @resort = Resort.find(params[:id])

  #   respond_to do |format|
  #     if @resort.update_attributes(params[:resort])
  #     format.html { redirect_to @resort, notice: 'Resort was successfully updated.' }
  #     else
  #     format.html { render action: "edit" }
  #     end
  #   end
  # end
end
