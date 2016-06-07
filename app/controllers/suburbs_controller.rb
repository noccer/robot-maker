class SuburbsController < ApplicationController
  def index
    respond_to do |format|
    format.html
    format.json { @suburbs = Suburb.search(params[:term]) }
    # @suburbs = Suburb.all
    # @suburbs = Suburb.all.includes(:suburb_name, :state, :postcode, :latitude, :longitude)
  end

  def show
    @suburb = Suburb.find(params[:id])
  end
end
