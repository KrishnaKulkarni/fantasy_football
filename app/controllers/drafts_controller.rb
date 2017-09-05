class DraftsController < ApplicationController
  before_action :set_league, only: [:show]

  # GET /leagues/1/draft
  # GET /leagues/1/draft
  def show
    @scarcity_data = ScarcityIndicator.run(@league)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:league_id])
    end
end
