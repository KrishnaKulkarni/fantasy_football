class DraftsController < ApplicationController
  before_action :set_league, only: [:show, :update]

  # GET /leagues/1/draft
  def show
    @scarcity_data = ScarcityIndicator.run(@league)
  end

  # PATCH /leagues/1/draft
  def update
    roster = Roster.find(params[:roster_id])
    player = Player.find(params[:player_id])
    cost = params.fetch(:cost).to_i

    roster.draft(player, cost)

    redirect_to league_draft_path(@league), notice: "#{roster.name} drafted #{player.name} for $#{cost}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:league_id])
    end
end
