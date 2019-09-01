class MeetingsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_meeting, only: [ :show ]

  def index
    @meetings = current_user.meetings
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user

    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def show
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :user)
  end
end
