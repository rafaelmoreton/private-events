class UsersController < ApplicationController
  def show
    puts "DEEEBUUUG"
    @user = User.find(params[:id])
  end
end
