class ConfessionsController < ApplicationController
  before_action :set_confession, only: [:show, :edit, :update, :destroy]

  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.all
  end

  # GET /confessions/1
  # GET /confessions/1.json
  def show
  end

  # GET /confessions/new
  def new
    @confession = Confession.new
  end

  # GET /confessions/1/edit
  def edit
  end

  # POST /confessions
  # POST /confessions.json
  def create
    @confession = Confession.new(confession_params)

    respond_to do |format|
      if @confession.save
        format.html { redirect_to @confession, notice: 'Confession was successfully created.' }
        format.json { render :show, status: :created, location: @confession }
      else
        format.html { render :new }
        format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confessions/1
  # PATCH/PUT /confessions/1.json
  def update
    respond_to do |format|
      if @confession.update(confession_params)
        format.html { redirect_to @confession, notice: 'Confession was successfully updated.' }
        format.json { render :show, status: :ok, location: @confession }
      else
        format.html { render :edit }
        format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confessions/1
  # DELETE /confessions/1.json
  def destroy
    @confession.destroy
    respond_to do |format|
      format.html { redirect_to confessions_url, notice: 'Confession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confession
      @confession = Confession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confession_params
      params.require(:confession).permit(:description)
    end
end
