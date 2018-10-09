require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
  	@w = WeatherService.get(params[:city])
	if @w
		@temperature = (9 / 5) * (@w[:temperature] - 273) + 32
		city = City.new(name:params[:city], landmark: 'Unknown', population:'Unknown')
		city.save
	end
  end
  def view
  end

  def new
  	render 'new'
  end

  def create
  	@name = params[:name]
  	if @name
  		if not City.all.has_key?(@name.to_sym)
  			@w = WeatherService.get(@name)
  			if @w
			  	newone = City.new(name: params[:name], landmark: params[:landmark], 
			  						   population: params[:population])
			  	newone.save
			  	redirect_to :action => 'view'
			else
				render 'nocity'
			end
		else
			render 'duplicate'
	  	
	    end
  	end
  end

  def update
  	render 'update'
  end

  def update1
  	@name = params[:name]
  	if @name.length>0
  		city = City.all[@name.to_sym]
  		if city
	  		city.update(params)
	  		city.save
	  		redirect_to :action => 'view'
	  	else
	  		render 'nocity'
	  	end
  	else
  		render 'noname'
  	end
  end
end