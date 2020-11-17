class TreesController < ApplicationController
  
  get '/trees' do
    if !logged_in?
      redirect to "/login"
    else
      erb :"trees/index"
    end
  end

  get '/trees/new' do
    if !logged_in?
      redirect to "/login"
    else
      erb :"trees/new"
    end
  end

  post '/trees' do
    if !logged_in?
      redirect to "/login"
    else
      if params[:tree][:species_id] == "" && params[:new_species] != ""                      # If user wants to enter new species
        species = Species.create(name: params[:new_species])
      elsif params[:tree][:species_id] == "" && params[:new_species] == ""                   # If user does not select a species
        species = Species.find_by_name("Unknown")
      end
      tree = current_user.trees.build(params[:tree])
      tree.species_id = species.id
      tree.save
      redirect to "/trees/#{tree.id}"
    end
  end

  get '/trees/:id' do
    if !logged_in?
      redirect to "/login"
    else
      @tree = current_user.trees.find(params[:id])
      erb :"trees/view"
    end
  end

  get '/trees/:id/edit' do
    if !logged_in?
      redirect to "/login"
    else

    end
  end
end