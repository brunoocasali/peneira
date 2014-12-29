class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @athletes = Athlete.all.page(params[:page])
    respond_with(@athletes)
  end

  def show
    respond_with(@athlete)
  end

  def new
    @athlete = Athlete.new
    respond_with(@athlete)
  end

  def edit
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.save
    respond_with(@athlete)
  end

  def update
    @athlete.update(athlete_params)
    respond_with(@athlete)
  end

  def destroy
    @athlete.destroy
    respond_with(@athlete)
  end

  private
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    def athlete_params
      params.require(:athlete).permit(:user_id, :birthday, :height, :weight, :foot_id, :position_id, :allow_to_travel)
    end
end
