class TreesController < ApplicationController
  
  get '/trees/new' do
    erb :"trees/new"
  end
  
  post '/trees' do
    binding.pry
    if params[:tree][:species_id] == "" && params[:new_species] != ""
    #   # code
    elsif params[:tree][:species_id] == "" && params[:new_species] == ""
        # code for if no species selected
    else
    #   # code
    end
  end
end