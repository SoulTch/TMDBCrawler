class IndexController < ApplicationController
  def attr_series(tar, comment)
    arr = []
    tar.each do |x| 
      arr.append(x.to_col)
    end

    return {key: comment, val: arr}
  end

  def movie
    if not params[:id] then
      @title = "movie list"
      @content = nil
      @info = nil

      movie_list = Movie.all
      @list = []

      movie_list.each do |x|
        @list.append(x.to_col)
      end

      render :list
    else
      t = Movie.find(params[:id])
      @title = t.to_s
      @content = nil
      @list = nil

      @info = []
      @info.append(attr_series(t.people.uniq, "Credits"))

      render :list
    end
  end



  def person
    if not params[:id] then
      @title = "person list"
      @content = nil
      @info = nil

      person_list = Person.all
      @list = []

      person_list.each do |x|
        @list.append(x.to_col)
      end

      render :list
    else
      t = Person.find(params[:id])
      @title = t.to_s
      @content = nil
      @list = nil

      @info = []
      @info.append(attr_series(t.movies.uniq, "Movies"))
      @info.append(attr_series(t.tvs.uniq, "Tvs"))
      @info.append(attr_series(t.tv_seasons.uniq, "Tv Seasons"))
      @info.append(attr_series(t.tv_episodes.uniq, "Tv Episodes"))

      render :list
    end
  end




  def tv
    if not params[:id] then
      @title = "Tv list"
      @content = nil
      @info = nil

      tv_list = Tv.all
      @list = []

      tv_list.each do |x|
        @list.append(x.to_col)
      end

      render :list
    else
      t = Tv.find(params[:id])
      @title = t.to_s
      @content = nil
      @list = nil

      @info = []
      @info.append(attr_series(t.people.uniq, "Credits"))
      @info.append(attr_series(t.tv_seasons.uniq, "Seasons"))
      @info.append(attr_series(t.tv_episodes.uniq, "Episodes"))

      render :list
    end
  end


  def season
    if not params[:season] then
      @title = "Season list"
      @content = nil
      @info = nil

      season_list = TvSeason.where("tv_seasons.tv_id = #{params[:id]}")
      @list = []

      season_list.each do |x|
        @list.append(x.to_col)
      end

      render :list
    else
      t = TvSeason.where("tv_seasons.tv_id = #{params[:id]} AND tv_seasons.season_number = #{params[:season]}").first
      @title = t.to_s
      @content = nil
      @list = nil

      @info = []
      @info.append(attr_series(t.people.uniq, "Credits"))
      @info.append(attr_series(t.tv_episodes.uniq, "Episodes"))

      render :list
    end
  end

  def episode
    if not params[:episode] then
      @title = "Episode list"
      @content = nil
      @info = nil

      episode_list = TvEpisode.where("tv_episodes.tv_id = #{params[:id]} AND tv_episodes.season_number = #{params[:season]}")
      @list = []

      episode_list.each do |x|
        @list.append(x.to_col)
      end

      render :list
    else
      t = TvEpisode.where("tv_episodes.tv_id = #{params[:id]} AND tv_episodes.season_number = #{params[:season]} AND tv_episodes.episode_number = #{params[:episode]}").first
      @title = t.to_s
      @content = nil
      @list = nil

      @info = []
      @info.append(attr_series(t.people.uniq, "Credits"))

      render :list
    end
  end
end
