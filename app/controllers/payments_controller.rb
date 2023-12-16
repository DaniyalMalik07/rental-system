# frozen_string_literal: true

require 'csv'

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  def index
    @payments = Payment.all
    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(@payments), filename: "all-properties-#{Date.today}.csv" }
    end
  end

  def show; end

  def new
    @payment = Payment.new
  end

  def edit; end

  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:lease_id, :date, :amount, :payment_method, :month, :year)
  end

  def generate_csv(payments)
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Lease', 'Date', 'Amount', 'Payment Method', 'Month', 'Year']
      payments.each do |payment|
        csv << [payment.id, payment.lease.property.address, payment.amount, payment.date.strftime('%b %d %Y'),
                payment.payment_method.humanize, payment.month, payment.year]
      end
    end
  end
end
