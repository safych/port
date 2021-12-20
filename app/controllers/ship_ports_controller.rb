class ShipPortsController < ApplicationController
  def index
    @ports = ShipPort.all
    if params['search_name'].present?
      @ports = @ports.where(name: params['search_name'])
    end
    ordering_direction = params[:sort] == "від я до а" ? :desc : :asc
    @ports = @ports.order(name: ordering_direction)
  end

  def new;  end

  def create
    ShipPort.create!(port_params)
    redirect_to ship_ports_path
  end

  def edit
    @port = ShipPort.find(params['id'])
  end

  def update
    port = ShipPort.find(params['id'])
    port.update(name: params['porte']['name'],
                location: params['porte']['location'])
    redirect_to ship_ports_path
  end

  def destroy
    port = ShipPort.find(params['id'])
    port.delete
    redirect_to ship_ports_path
  end

  private

  def port_params
    params.require(:ship_port).permit(:name, :location)
  end
end
