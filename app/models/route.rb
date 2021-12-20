class Route < ApplicationRecord
  belongs_to :ship
  belongs_to :from_port, class_name: "ShipPort"
  belongs_to :to_port, class_name: "ShipPort"
end
