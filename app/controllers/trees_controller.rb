class TreesController < ApplicationController
  
  get '/trees' do
    erb :"trees/index"
  end

  get '/trees/new' do
    erb :"trees/new"
  end

  post '/trees' do
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

  get '/trees/:id' do
    @tree = current_user.trees.find(params[:id])
    erb :"trees/view"
  end
end