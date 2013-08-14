class Statistics::MediansController < Statistics::BaseController
	def index
    @options = [
      { title: 'Median Average Time Between Statement Clicks', key: :average_time_between_statement_clicks },
      { title: 'Median Average Time Spent Per Question', key: :overall_time }
    ]
	end
	def show
    if %w(average_time_between_statement_clicks overall_time).include? params[:id]
      start_percentile = params[:start].try(:to_f) || 50
      end_percentile = params[:end].try(:to_f) || 100
      @user = PercentileFinder.new(start_percentile, end_percentile, params[:id].humanize, lambda { |user| user.send(params[:id]) })
    else
      redirect_to statistics_medians_path, notice: 'Invalid id'
    end
	end
end
