class ShipsController < ApplicationController
  def index
    @ships = Ship.all
    if params['search_name'].present?
      @ships = @ships.where(name: params['search_name'])
    end
    ordering_direction = params[:sort] == "від я до а" ? :desc : :asc
    @ships = @ships.order(name: ordering_direction)
  end

  def new;  end

  def create
    Ship.create!(ship_params)
    redirect_to ships_path
  end

  def edit
    @ship = Ship.find(params['id'])
  end

  def update
    ship = Ship.find(params['id'])
    ship.update(ship_params)
    redirect_to ships_path
  end

  def destroy
    ship = Ship.find(params['id'])
    ship.delete
    redirect_to ships_path
  end

  private

  def ship_params
    params.require(:ship).permit(
      :reg_number, :name, :load_capacity
    )
  end
end
