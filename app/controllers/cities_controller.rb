class CitiesController < ApplicationController

  def index
    cities = City.on_address.map{ |c| { id: c.id, name: "#{c.name} - #{c.state.acronym}" } }

    respond_to do |format|
      format.json { render json: cities }
    end
  end

  def show
    city = City.find(params[:id])
    city_as_json = city.as_json
    city_as_json[:full_name] = city.full_name

    respond_to do |format|
      format.json { render json: city_as_json }
    end
  end
end
