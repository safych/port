class WelcomeController < ApplicationController
  def index
    ship = Ship.all
    @ships = ship.size
    rout = Route.all
    @routes = rout.size
    cargoe = Cargoe.all
    @cargoes = cargoe.size
    port = ShipPort.all
    @ports = port.size
  end
end
