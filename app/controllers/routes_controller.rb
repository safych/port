class RoutesController < ApplicationController
  def index
    @routes = Route.order(:id)
  end

  def new;  end

  def create
    Route.create!(route_params)
    redirect_to routes_path
  end

  def edit
    @route = Route.find(params['id'])
  end

  def update
    route = Route.find(params['id'])
    route.update(route_params)
    redirect_to routes_path
  end

  def destroy
    route = Route.find(params['id'])
    route.delete
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(
      :ship_id, :from_port_id, :to_port_id, :departure_time, :arrival_time
    )
  end
end
