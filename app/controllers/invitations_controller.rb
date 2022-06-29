class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new
    @invitation.attendee_id = current_user.id
    @invitation.attended_event_id = params[:invitation][:event_id]

    if @invitation.save
       redirect_to event_path(params[:invitation][:event_id]), notice: "Event attendance confirmed"
    else
       redirect_to event_path(params[:invitation][:event_id]), alert: "Couldn't attend the event"
    end
  end
end
