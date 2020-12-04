class TreesController < ApplicationController
  
  get '/trees' do
    authentication
    erb :"trees/index"
  end

  get '/trees/new' do
    authentication
    erb :"trees/new"
  end

  post '/trees' do
    authentication
    select_or_create_species
    tree = current_user.trees.build(params[:tree])
    tree.species_id = @species.id
    tree.save
    redirect to "/trees/#{tree.id}"
  end

  get '/trees/:id' do
    authorize_changes
    erb :"trees/show"
  end

  get '/trees/:id/edit' do
    authorize_changes
    erb :"trees/edit"
  end

  patch '/trees/:id' do
    authorize_changes
    if params[:tree][:species_id] == "" && params[:new_species] != ""                      # If user wants to enter new species
      species = Species.create(name: params[:new_species])
    elsif params[:tree][:species_id] == "" && params[:new_species] == ""                   # If user does not select a species
      species = Species.find_by_name("Unknown")
    else
      species = Species.find(params[:tree][:species_id])
    end
    @tree.update(params[:tree])
    @tree.species_id = species.id
    @tree.save
    redirect to "/trees/#{@tree.id}"
  end

  delete '/trees/:id' do
    authorize_changes
    @tree.destroy
    redirect to "/trees"
  end

  private

  def select_or_create_species
    if params[:tree][:species_id] == "" && params[:new_species] != ""         # If user wants to enter new species
      @species = Species.create(name: params[:new_species])
    elsif params[:tree][:species_id] == "" && params[:new_species] == ""      # If user does not select a species
      @species = Species.find_by_name("Unknown")
    else                                                                      # If user simply selects from dropdown
      @species = Species.find(params[:tree][:species_id])
    end
  end

  def authorize_changes
    authentication
    @tree = Tree.find(params[:id])
    authorize(@tree)
  end

end