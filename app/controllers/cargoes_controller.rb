class CargoesController < ApplicationController
  def index
    if params[:sort] == "від нецінного"
      @cargoes = Cargoe.order(:value).reverse_order
    elsif params[:sort] == "від цінного"
      @cargoes = Cargoe.order(:value)
    elsif params[:sort] == "назва(від а до я)"
      @cargoes = Cargoe.order(:name)
    elsif params[:sort] == "назва(від я до а)"
      @cargoes = Cargoe.order(:name).reverse_order
    elsif params[:sort] == "від легшого"
      @cargoes = Cargoe.order(:mass)
    elsif params[:sort] == "від важчого"
      @cargoes = Cargoe.order(:mass).reverse_order
    elsif params[:search_for] == "назвою"
      @cargoes = Cargoe.where(name: params['search'])
    elsif params[:search_for] == "цінністю"
      @cargoes = Cargoe.where(value: params['search'])
    elsif params[:search_for] == "масою"
      @cargoes = Cargoe.where(mass: params['search'])
    elsif params[:search_for] == "реєстраційним номером"
      @cargoes = Cargoe.where(reg_number: params['search'])
    else
      @cargoes = Cargoe.order(:id)
    end
  end

  def new;  end

  def create
    Cargoe.create!(cargoe_params)
    redirect_to cargoes_path
  end

  def edit
    @cargoe = Cargoe.find(params['id'])
  end

  def update
    cargoe = Cargoe.find(params['id'])
    cargoe.update(cargoe_params)
    redirect_to cargoes_path
  end

  def destroy
    cargoe = Cargoe.find(params['id'])
    cargoe.delete
    redirect_to cargoes_path
  end

  private

  def cargoe_params
    params.require(:cargoe).permit(
      :name, :value, :mass, :reg_number, :route_id
    )
  end
end
