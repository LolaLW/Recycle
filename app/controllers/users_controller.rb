class UsersController < ApplicationController
  before_action :set_user, only: [:update]
  def update
    address = user_params[:address]
    postal_code = address[/\d{5}/]
    @pickup = Pickup.find_by(name: postal_code)
    @user.pickup = @pickup
    @user.update(user_params)
    redirect_to dashboard_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:address)
  end
end
