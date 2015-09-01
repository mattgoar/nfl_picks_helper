class NflResult < ActiveRecord::Base

  def self.get_schedule()
    NflResult.delete_all
    weeks = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]

    weeks.each do |w|
      s = Net::HTTP.get_response(URI.parse('http://www.nfl.com/ajax/scorestrip?season=2015&seasonType=REG&week='+(w.to_s))).body
      parsed_data = JSON.parse(Hash.from_xml(s).to_json)
      game_data = parsed_data["ss"]["gms"]["g"]
      num_games = game_data.count
      current_game = 0
      while current_game < num_games do
        game = NflResult.new
        game.week = w
        game.home = game_data[current_game]["h"]
        game.visitor = game_data[current_game]["v"]
        game.result =
         if game_data[current_game]["hs"] = ""
            then 'Not Played'
          elsif game_data[current_game]["vs"] > game_data[current_game]["hs"]
            then game_data[current_game]["v"]
          elsif game_data[current_game]["vs"] < game_data[current_game]["hs"]
            then game_data[current_game]["h"]
          else 'Tie'
          end
        game.eid = game_data[current_game]["eid"]
        game.gsis = game_data[current_game]["gsis"]
        game.game_date = game_data[current_game]["d"]
        game.game_time = game_data[current_game]["t"]
        game.save
        current_game = current_game + 1
      end
    end
  end

  def self.update_results(week)
    s = Net::HTTP.get_response(URI.parse('http://www.nfl.com/ajax/scorestrip?season=2015&seasonType=REG&week='+(week.to_s))).body
    parsed_data = JSON.parse(Hash.from_xml(s).to_json)
    game_data = parsed_data["ss"]["gms"]["g"]

    num_games = game_data.count
    current_game = 0
    while current_game < num_games do
      game = NflResult.find_by(gsis: game_data[current_game]["gsis"])
      game.result =
       if game_data[current_game]["hs"] = ""
          then 'Not Played'
        elsif game_data[current_game]["vs"] > game_data[current_game]["hs"]
          then game_data[current_game]["v"]
        elsif game_data[current_game]["vs"] < game_data[current_game]["hs"]
          then game_data[current_game]["h"]
        else 'Tie'
        end
      game.save
      current_game = current_game + 1
    end
  end

end
