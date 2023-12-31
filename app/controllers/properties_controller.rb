# frozen_string_literal: true

require 'csv'
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = Property.all
    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(@properties), filename: "all-properties-#{Date.today}.csv" }
    end
  end

  def show; end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = Property.new(property_params)

    if @property.save
      flash[:notice] = 'Property was successfully created.'
      redirect_to property_url(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      flash[:notice] = 'Property was successfully updated.'
      redirect_to property_url(@property)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy

    flash[:notice] = 'Property was successfully destroyed.'
    redirect_to properties_url
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:address, :advance_amount, :rent_amount, :status, :owner_id, images: [])
  end

  def generate_csv(properties)
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Address', 'Advance Amount', 'Rent Amount', 'Owner', 'Status']
      properties.each do |property|
        csv << [property.id, property.address, property.advance_amount, property.rent_amount, property.owner.full_name,
                property.status.humanize]
      end
    end
  end
end
