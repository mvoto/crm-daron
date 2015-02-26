class StatesController < ApplicationController

  def show
    state = State.where(acronym: params[:acronym]).first

    respond_to do |format|
      format.json { render json: state }
    end
  end
end
