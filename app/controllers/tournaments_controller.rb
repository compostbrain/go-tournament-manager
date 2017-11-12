class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy]

  def index
    @tournaments = Tournament.order(created_at: :desc)
    @import = Tournament::Import.new
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
        @rounds << Round.new(number: number + 1, tournament: @tournament)
      end

      if @rounds.each(&:save)
        redirect_to root_path, notice: "New tournament created"
      else
        render :new, notice: "There was an error."
      end

    else
      render :new, notice: "There was an error."
    end
  end

  def show
    @player = Player.find_by(id: params[:player_id]) || Player.new
    @tournament = Tournament.find(params[:id])
    @tournament_registration = TournamentRegistration.find_by(
      player_id: @player.id,
      tournament_id: @tournament.id,
    ) || TournamentRegistration.new

    all_players = Player.all
    @players = Player.joins(
      :tournament_registrations,
    ).where(
      tournament_registrations: { tournament_id: @tournament.id },
    ).where(id: all_players.map(&:id))
  end

  def import
    @import = Tournament::Import.new tournament_import_params
    if @import.save
      redirect_to tournaments_path, notice: "Imported tournament successfully"
    else
      @tournaments = Tournament.order(created_at: :desc)
      render action: :index, notice: "There were errors with your CSV file"
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :location,
      :begin_date,
      :end_date,
      :number_of_rounds,
    )
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_import_params
    params.require(:tournament_import).permit(:file)
  end
end
