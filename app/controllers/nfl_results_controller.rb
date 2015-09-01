class NflResultsController < ApplicationController
  def index
    @nfl_results = NflResult.all
    @result = pivot()

  end

  # def show
  #   @nfl_result = NflResult.find(params[:id])
  # end

  # def new
  #   @nfl_result = NflResult.new
  # end

  # # def create
  # #   @nfl_result = NflResult.new

  # #   @nfl_result.week = params[:week]

  # #   @nfl_result.home = params[:home]

  # #   @nfl_result.visitor = params[:visitor]

  # #   @nfl_result.result = params[:result]

  # #   @nfl_result.eid = params[:eid]

  # #   @nfl_result.gsis = params[:gsis]

  # #   @nfl_result.game_date = params[:game_date]

  # #   @nfl_result.game_time = params[:game_time]



  # #   if @nfl_result.save
  # #     redirect_to "/nfl_results", :notice => "Nfl result created successfully."
  # #   else
  # #     render 'new'
  # #   end

  # # end

  # def edit
  #   @nfl_result = NflResult.find(params[:id])
  # end

  # def update
  #   @nfl_result = NflResult.find(params[:id])


  #   @nfl_result.week = params[:week]

  #   @nfl_result.home = params[:home]

  #   @nfl_result.visitor = params[:visitor]

  #   @nfl_result.result = params[:result]

  #   @nfl_result.eid = params[:eid]

  #   @nfl_result.gsis = params[:gsis]

  #   @nfl_result.game_date = params[:game_date]

  #   @nfl_result.game_time = params[:game_time]



  #   if @nfl_result.save
  #     redirect_to "/nfl_results", :notice => "Nfl result updated successfully."
  #   else
  #     render 'edit'
  #   end

  # end

  # def destroy
  #   @nfl_result = NflResult.find(params[:id])

  #   @nfl_result.destroy


  #   redirect_to "/nfl_results", :notice => "Nfl result deleted."

  # end

  def pivot
    result = Array.new
    weeks = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
    weeks.each do |w|

      #
      # Week
      # Home
      # Away
      # Result
      #

      subresult = Array.new
      subresult.push(w, [], [], [])
      week_results = NflResult.where(week: w)
      week_results.each do |result|
        subresult[1].push(result.home)
        subresult[2].push(result.visitor)
        subresult[3].push(result.result)
      end
      result.push(subresult)
    end
    result
  end

end
