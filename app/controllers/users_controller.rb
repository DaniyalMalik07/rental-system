# frozen_string_literal: true

require 'csv'

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(@users), filename: "all-users-#{Date.today}.csv" }
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to user_url(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to user_url(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User was successfully destroyed.'
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :address, :phone_number, :email)
  end

  def generate_csv(users)
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'First Name', 'Last Name', 'Email', 'Phone Number', 'Date of Birth']
      users.each do |user|
        csv << [user.id, user.first_name, user.last_name, user.email, user.phone_number, user.dob.strftime('%b %d %Y')]
      end
    end
  end
end
