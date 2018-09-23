# frozen_string_literal: true

class FightersController < ApplicationController
  before_action :set_fighter, only: %i[show edit update destroy]

  # GET /fighters
  # GET /fighters.json
  def index
    @fighters = Fighter.all
  end

  # GET /fighters/1
  # GET /fighters/1.json
  def show; end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/1/edit
  def edit; end

  # POST /fighters
  # POST /fighters.json
  def create
    @fighter = Fighter.new(fighter_params)
    respond_to do |format|
      if @fighter.save
        flash[:success] = 'Combattant créé'
        format.html { redirect_to root_path }
      else
        flash.now[:danger] = @fighter.errors.full_messages.first
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /fighters/1
  # PATCH/PUT /fighters/1.json
  def update
    respond_to do |format|
      if @fighter.update!(fighter_params)
        flash[:success] = 'Combattant à jour'
        format.html { redirect_to root_path }
        # format.json { render :show, status: :ok, location: @fighter }
      else
        flash.now[:danger] = @fighter.errors.full_messages.first
        format.html { render :edit }
      end
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      flash.now[:info] = 'Combattant supprimé'
      format.html { redirect_to fighters_url }
      format.json { head :no_content }
    end
  end

  def home; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fighter_params
    params.require(:fighter).permit(:name, :health_points, :attack_strength, :avatar)
  end
end
