class LeasesController < ApplicationController
  before_action :set_lease, only: %i[ show edit update destroy ]

  # GET /leases or /leases.json
  def index
    @leases = Lease.all
  end

  def show; end

  def new
    @lease = Lease.new
  end

  def edit; end

  def create
    @lease = Lease.new(lease_params)

    respond_to do |format|
      if @lease.save
        format.html { redirect_to lease_url(@lease), notice: "Lease was successfully created." }
        format.json { render :show, status: :created, location: @lease }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1 or /leases/1.json
  def update
    respond_to do |format|
      if @lease.update(lease_params)
        format.html { redirect_to lease_url(@lease), notice: 'Lease was successfully updated.' }
        format.json { render :show, status: :ok, location: @lease }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1 or /leases/1.json
  def destroy
    @lease.destroy

    respond_to do |format|
      format.html { redirect_to leases_url, notice: 'Lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_lease
    @lease = Lease.find(params[:id])
  end

  def lease_params
    params.require(:lease).permit(:property_id, :tenant_id, :start_date, :end_date, :rent_amount, :advance_amount)
  end
end
