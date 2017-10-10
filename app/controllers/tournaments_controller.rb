class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy]


  def index
    @tournaments = Tournament.order(created_at: :desc)
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user_id = current_user.id

    if @tournament.save
      @rounds = []
      params[:tournament][:number_of_rounds].to_i.times do |number|
        @rounds << Round.new(number: number, tournament: @tournament)
      end

      if @rounds.each(&:save)
        redirect_to @tournament, notice: "New tournament created"
      else
        render :new, notice: "There was an error."
      end

    else
      render :new, notice: "There was an error."
    end
  end

  def show; end

  private

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :location,
      :begin_date,
      :end_date,
      :number_of_rounds
    )
  end

  def number_of_rounds

  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
