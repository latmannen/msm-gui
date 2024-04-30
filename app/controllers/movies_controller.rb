class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    #params hash: 
    # {"the_title"=>"1", "the_year"=>"1", "the_duration"=>"2", "the_description"=>"3", "the_image"=>"4", "the_director_id"=>"5"}
    #retrieve users inputs from params
    m = Movie.new
    m.title = params.fetch("title_field")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
 
    m.save

    redirect_to("/movies")
    #create record in movie table
    
    #population columns with user input
    
    #save

    #Redirect the user back to /movies URL


  end
end
