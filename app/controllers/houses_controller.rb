class HousesController < ApplicationController
  # before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def attack

  	@house = current_house

  	@every = params
  	@house_attacked = House.find(params[:email])
  	@attack_points = params[:attack_points].to_i

  	@house_attacked.point.health -= @attack_points
  	@house_attacked.point.save
  	@house.point.attack -= @attack_points
	@house.point.save

	redirect_to houses_path

  end

  def index
  	if (!house_signed_in?) 
  		redirect_to new_house_session_path
  	end
    @point = current_house.point
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @point = Point.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'Point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
      params.require(:point).permit(:health, :attack)
    end
end
