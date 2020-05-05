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
      @info.append(attr_series(Person.joins(:movies).where("movies.id = #{t.id}"), "Credits"))

      p @info
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
      @info.append(attr_series(Movie.joins(:people).where("people.id = #{t.id}"), "Movies"))
      @info.append(attr_series(Tv.joins(:people).where("people.id = #{t.id}"), "Tvs"))
      @info.append(attr_series(TvSeason.joins(:people).where("people.id = #{t.id}"), "Tv Seasons"))
      @info.append(attr_series(TvEpisode.joins(:people).where("people.id = #{t.id}"), "Tv Episodes"))

      p @info
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
      @info.append(attr_series(Person.joins(:tvs).where("tvs.id = #{t.id}"), "Credits"))
      @info.append(attr_series(t.tv_seasons, "Seasons"))
      @info.append(attr_series(t.tv_episodes, "Episodes"))

      p @info
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
      @info.append(attr_series(Person.joins(:tv_seasons).where("tv_seasons.id = #{t.id}"), "Credits"))
      @info.append(attr_series(t.tv_episodes, "Episodes"))

      p @info
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
      @info.append(attr_series(Person.joins(:tv_episodes).where("tv_episodes.id = #{t.id}"), "Credits"))

      p @info
      render :list
    end
  end
end
