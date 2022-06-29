class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id

    if @event.save
       redirect_to event_url(@event), notice: "Event was successfully created."
    else
       render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @invitation = Invitation.new
  end

  private

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :location, :date, :description)
  end
end
