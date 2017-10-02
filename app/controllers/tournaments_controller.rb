class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy]

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament, notice: "New tournament created"
    else
      render :new
    end
  end

  def show; end

  private

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :location,
      :director,
      :begin_date,
      :end_date,
    )
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
