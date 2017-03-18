class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @activity = current_user.activities.build
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      redirect_to new_activity_path
    end
  end

  def activity_params
    params.require(:activity).permit(:name, :exertion)
  end

  def index
    @activities = current_user.activities.all
  end

end
