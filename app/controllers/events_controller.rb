class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @events = Event.all.order(:start_date)
  end

  def new
    @event = Event.new
  end

  def create 
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], admin_id: current_user.id, location: params[:location])

    if @event.save
      redirect_to(event_path(@event.id))
    else
      render(new_event_path)
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
