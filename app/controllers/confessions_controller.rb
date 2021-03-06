  class ConfessionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_confession, only: [:show, :edit, :update, :destroy]

  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    @p_confessions = Confession.find_with_reputation(:votes, :all, order: "votes desc")
  end

  # GET /confessions/1
  # GET /confessions/1.json
  def show
    @confession = Confession.find(params[:id])
  end

  def vote
    value = params[:type]  == "up" ? 1 : 0
    @confession = Confession.find(params[:id])
    @confession.add_or_update_evaluation(:votes, value, current_user )
    redirect_to @confession
  end

  # GET /confessions/new
  def new
    @confession = current_user.confessions.build
  end

  # GET /confessions/1/edit
  def edit
  end

  # POST /confessions
  # POST /confessions.json
  def create
    @confession = current_user.confessions.build(confession_params)
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

    def correct_user
      @confession = current_user.confessions.find_by(id: params[:id])
      redirect_to confessions_path, notice: "Not authorized to edit this pin" if @confession.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confession_params
      params.require(:confession).permit(:description)
    end
end
