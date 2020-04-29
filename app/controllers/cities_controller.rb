class CitiesController < ApplicationController

  def index
    cities = City.on_address.map{ |c| { id: c.id, name: "#{c.name} - #{c.state.acronym}" } }

    respond_to do |format|
      format.json { render json: cities }
    end
  end
end
