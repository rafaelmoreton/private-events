class InvitationsController < ApplicationController
  before_action :store_location
  before_action :authenticate_user!, only: %i[ create destroy ]

  def create
    @invitation = Invitation.new
    @invitation.attendee_id = current_user.id
    @invitation.attended_event_id = params[:event_id]

    if @invitation.save
       redirect_to event_path(params[:event_id]), notice: "Event attendance confirmed"
    else
       redirect_to event_path(params[:event_id]), notice: @invitation.errors[:attendee_id][0]
    end
  end

  def destroy
    @invitation = Invitation.where("attendee_id = ? AND attended_event_id = ?", current_user.id, params[:event_id]).take
    @invitation&.destroy

    redirect_to event_path
  end

  private

  def store_location
    session[:user_return_to] = event_url(params[:event_id])
  end
end
