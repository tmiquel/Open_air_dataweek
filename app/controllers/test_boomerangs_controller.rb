class TestBoomerangsController < ApplicationController
  before_action :set_test_boomerang, only: [:show, :edit, :update, :destroy]

  # GET /test_boomerangs
  # GET /test_boomerangs.json
  def index
    @test_boomerangs = TestBoomerang.all
  end

  # GET /test_boomerangs/1
  # GET /test_boomerangs/1.json
  def show
  end

  # GET /test_boomerangs/new
  def new
    @test_boomerang = TestBoomerang.new
  end

  # GET /test_boomerangs/1/edit
  def edit
  end

  # POST /test_boomerangs
  # POST /test_boomerangs.json
  def create
    @test_boomerang = TestBoomerang.new(test_boomerang_params)

    respond_to do |format|
      if @test_boomerang.save
        format.html { redirect_to @test_boomerang, notice: 'Test boomerang was successfully created.' }
        format.json { render :show, status: :created, location: @test_boomerang }
      else
        format.html { render :new }
        format.json { render json: @test_boomerang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_boomerangs/1
  # PATCH/PUT /test_boomerangs/1.json
  def update
    respond_to do |format|
      if @test_boomerang.update(test_boomerang_params)
        format.html { redirect_to @test_boomerang, notice: 'Test boomerang was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_boomerang }
      else
        format.html { render :edit }
        format.json { render json: @test_boomerang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_boomerangs/1
  # DELETE /test_boomerangs/1.json
  def destroy
    @test_boomerang.destroy
    respond_to do |format|
      format.html { redirect_to test_boomerangs_url, notice: 'Test boomerang was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_boomerang
      @test_boomerang = TestBoomerang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_boomerang_params
      params.require(:test_boomerang).permit(:index)
    end
end
