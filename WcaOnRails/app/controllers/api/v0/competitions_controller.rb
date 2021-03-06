class Api::V0::CompetitionsController < Api::V0::ApiController
  def show
    competition = Competition.where(id: params[:id], showAtAll: true).first
    unless competition
      render json: { error: "Competition with id #{params[:id]} not found" }, status: 404
      return
    end
    render json: {
      status: "ok",
      id: competition.id,
      website: competition.website,
      start_date: competition.start_date,
      end_date: competition.end_date,
    }
  end
end
