class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    #params hash: 
    # {"the_title"=>"1", "the_year"=>"1", "the_duration"=>"2", "the_description"=>"3", "the_image"=>"4", "the_director_id"=>"5"}
    #retrieve users inputs from params
    m = Actor.new
    m.name = params.fetch("the_name")
    m.dob = params.fetch("the_dob")
    m.bio = params.fetch("the_bio")
    m.image = params.fetch("the_image")
 
    m.save

    redirect_to("/actors")
    #create record in movie table
    
    #population columns with user input
    
    #save

    #Redirect the user back to /movies URL

  end

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Actor.where({ :id => the_id})

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/actors")
  end
  def update
    #Params look like this:
    #  Parameters: {"title_field"=>"flubber 2", "the_year"=>"1000", "the_duration"=>"10", "the_description"=>"29", "the_image"=>"reddit.com", "the_director_id"=>"73", "the_id"=>"29"}
    #get the ID out of params
    m_id = params.fetch("the_id")
    
    #look up the existing record
    
    matching_records = Actor.where({ :id => m_id})
    the_actor = matching_records.at(0)
    
    #overwrite each column
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.bio = params.fetch("the_bio")
    the_actor.image = params.fetch("the_image")
    

    #save
    the_actor.save
    #redirect to the movie details page
    redirect_to("/actors/#{the_actor.id}")
  end
end
