class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: %i[show edit update destroy]

  def index
    @equipaments = Equipament.order(:name, :serial_number)
    authorize @equipaments
  end

  def new
    @equipament = Equipament.new
    authorize @equipament
  end

  def create
    @equipament = Equipament.new(equipament_params)
    authorize @equipament

    if @equipament.save
      flash[:success] = "Equipamento cadastrado com sucesso!"
      redirect_to equipaments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @equipament
  end


  def edit
    authorize @equipament
  end

  def update
    authorize @equipament

    if @equipament.update(equipament_params)
      redirect_to @equipament, notice: "Equipamento atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @equipament
    @equipament.destroy
    flash[:success] = "Equipamento removido com sucesso!"
    redirect_to equipaments_path
  end

  private

  def equipament_params
    params.require(:equipament).permit(:name, :serial_number, :description)
  end

  def load_equipament
    @equipament = Equipament.find(params[:id])
  end
end
