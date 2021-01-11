class ScoresController < ApplicationController

  def index
    @text1 = "This web-app displays live scores for the four most popular sports leagues in the US (NBA, NFL, NHL, MLB)."
    @text2 = "It is currently running on Ruby on Rails 6.0. The following are the additional dependencies:"
    @text3 = "Pick a league using the sidebar to see live scores! (if any)"
    @d1 = "HTML"
    @d2 = "CSS"
    @d3 = "Bootstrap (with Sprockets and Popper)"
    @d4 = "Javascript"
    @d5 = "jQuery"
    @text4 = "By Akhil Nalamala"
  end

  def nba
    @nba_scores = score_api('https://sportspage-feeds.p.rapidapi.com/games?status=in%20progress&league=nba')
  end

  def nfl
    @nfl_scores = score_api('https://sportspage-feeds.p.rapidapi.com/games?status=in%20progress&league=nfl')
  end

  def nhl
    @nhl_scores = score_api('https://sportspage-feeds.p.rapidapi.com/games?status=in%20progress&league=nhl')
  end

  def mlb
    @mlb_scores = score_api('https://sportspage-feeds.p.rapidapi.com/games?status=in%20progress&league=mlb')
  end

  private

    def score_api(url)
      response = Excon.get(url,
                           headers: {
                            'X-RapidAPI-Host' => ENV['APIHost'],
                            'X-RapidAPI-Key' => ENV['APIKEY']
                           })

      JSON.parse(response.body)
    end

end
