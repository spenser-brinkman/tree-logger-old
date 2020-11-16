class TreesController < ApplicationController
  post '/trees' do
    if params[:tree][:species_id] == "" && params[:new_species]
      # code
    else
      # code
    end
  end
end