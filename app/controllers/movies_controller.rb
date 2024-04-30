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

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ :id => the_id})

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end
  def update
    #Params look like this:
    #  Parameters: {"title_field"=>"flubber 2", "the_year"=>"1000", "the_duration"=>"10", "the_description"=>"29", "the_image"=>"reddit.com", "the_director_id"=>"73", "the_id"=>"29"}
    #get the ID out of params
    m_id = params.fetch("the_id")
    matching_records = Movie.where({ :id => m_id})
    the_movie = matching_records.at(0)
    
    #look up the existing record
    the_movie.title = params.fetch("title_field")
    the_movie.year = params.fetch("the_year")
    the_movie.duration = params.fetch("the_duration")
    the_movie.description = params.fetch("the_description")
    the_movie.image = params.fetch("the_image")
    the_movie.director_id = params.fetch("the_director_id")
    
    #overwrite each column
    #save
    the_movie.save
    #redirect to the movie details page
    redirect_to("/movies/#{the_movie.id}")
  end

end
