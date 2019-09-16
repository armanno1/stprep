module QuestionsHelper
  def has_station?(params)
    if params.has_key?(:station_id)
      return params[:station_id]
    elsif params.has_key?(:question) && params[:question].has_key?(:station_id)
      return params[:question][:station_id]
    else
      return 1
    end
  end
end
