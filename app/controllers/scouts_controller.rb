class ScoutsController < ApplicationController
  before_action :set_scout, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @scouts = Scout.all.page(params[:page])
    respond_with(@scouts)
  end

  def show
    respond_with(@scout)
  end

  def new
    @scout = Scout.new
    respond_with(@scout)
  end

  def edit
  end

  def create
    @scout = Scout.new(scout_params)
    @scout.save
    respond_with(@scout)
  end

  def update
    @scout.update(scout_params)
    respond_with(@scout)
  end

  def destroy
    @scout.destroy
    respond_with(@scout)
  end

  private
    def set_scout
      @scout = Scout.find(params[:id])
    end

    def scout_params
      params.require(:scout).permit(:user_id, :actual_club_id)
    end
end
