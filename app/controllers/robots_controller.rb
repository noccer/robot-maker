require 'HTTParty'
@api_key = '0d2497cde937a693c9884ca4cbf06723'

class RobotsController < ApplicationController
  def index
    @users = current_user
    @robots = Robot.all
  end
  def new
  end
################################################################################
  # generate random robot details automatically
  def robot_details_generator
    @robot.robot_name = Faker::Name.first_name
    quote = HTTParty.get('http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=10')
    @quote = quote[0]['content']
    offset = rand(Suburb.count)
    Suburb.all.where(:id => offset).each do |suburb|
      @robot.suburb = suburb.suburb_name
      @robot.postcode = suburb.postcode
      @robot.state = suburb.state
      @robot.latitude = suburb.latitude
      @robot.longitude = suburb.longitude
      @robot.quote = @quote
    end
  end

  #.add a robot picture into the database using RoboHash website
  def robot_image_generator
    img_base_url = 'https://robohash.org/'
    @robot.img_sm = img_base_url + @robot.robot_name + '?size=80x80'
    @robot.img_lg = img_base_url + @robot.robot_name + '?size=300x300'
  end
################################################################################
  def robot_params
    params.require(:robot).permit(:robot_name, :suburb, :postcode, :state, :latitude, :longitude, :quote)
  end
  def create_robot
    @robot = Robot.new(robot_params)
    @robot.user = current_user
    robot_image_generator

    if @robot.save
      flash[:message] = "Robot successfully created"
      redirect_to '/robots'
      return
    end
  end
################################################################################
  def robot_params_update
    # allow users to add in latitude or longitude
    params.fetch(:robot,{}).permit(:robot_name, :suburb, :postcode, :state, :latitude, :longitude, :quote)
  end
  def create_robot_automatically
    @robot = Robot.new(robot_params_update)
    @robot.user = current_user
    robot_details_generator
    robot_image_generator
    if @robot.save
      flash[:message] = "Robot successfully created"
      redirect_to '/robots'
      return
    end
  end

  def show
    @robot = Robot.find(params[:id])
    #api key store, can be changed easily if required
    openweathermap_api = '0d2497cde937a693c9884ca4cbf06723'
    #generate weather url for HTTParty to fetch, concatenated string. converted lat/long to strings
    robot_weather_url = 'http://api.openweathermap.org/data/2.5/weather?lat=' + @robot.latitude.to_s + '&lon=' + @robot.longitude.to_s + '&appid=' + openweathermap_api
    #fetch weather data
    robot_weather = HTTParty.get(robot_weather_url)
    # make global variable
    @robot_weather = robot_weather
  end

  #make output_weather method available across the app
  helper_method :output_weather
  #output_weather is a function that outputs the temperature from the api, depending on
  #which argument is passed in : 'temp' 'temp_max' or 'temp_min'
  def output_weather(api_call)
    #convert to celsius
    robot_weather_temp = (@robot_weather['main'][api_call].to_f - 273.15).round
    # make global
    @robot_weather_temp = robot_weather_temp
  end

  def edit
    @robot = Robot.find(params[:id])
  end

  def update
    @robot = Robot.find_by_id(params[:id])
    @robot.user = current_user
    robot_image_generator
    respond_to do |format|
      if @robot.update(robot_params)
        format.html { redirect_to robots_path, notice: 'Robot was successfully updated.' }
        # format.json { render :index, status: :ok, location: @robot }
      else
        format.html { render :edit }
        # format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.robots.find(params[:id]).delete
    flash[:message] = "Robot successfully deleted"
    redirect_to '/robots'
  end

end
