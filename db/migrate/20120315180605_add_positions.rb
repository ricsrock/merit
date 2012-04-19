class AddPositions < ActiveRecord::Migration
  def up
    keys = [:name, :notes, :min_pay, :max_pay, :exempt]
    positions = [
        ["Clerk","A clerk", "7.25", "10.00", "false"],
        ["Cashier", "A cashier", "7.25", "10.00", "false"],
        ["Stocker", "A Stocker", "7.25", "10.00", "false"],
        ["Meat Wrapper", "A meat wrapper", "9.00", "12.00", "false"],
        ["Floral Helper", "Helps in floral department", "7.25", "10.00", "false"],
        ["Bakery/Deli Helper", "Helps in Bakery/Deli", "7.25", "10.00", "false"],
        ["Produce Helper", "Helps in produce department", "7.25", "10.00", "false"],
        ["DSD Lead", "Manages DSD", "8.50", "10.50", "false"],
        ["Office Manager", "Manages the front office in a store", "8.50", "12.00", "false"],
        ["Floral Manager", "Manages the floral department", "8.50", "12.00", "false"],
        ["Meat Cutter", "Cuts meat", "8.50", "14.00", "false"],
        ["Produce Manager", "Manages the produce department", "10.00", "15.40", "false"],
        ["Tobacco Manager", "Manages a tobacco store", "10.00", "15.40", "false"],
        ["Bakery/Deli Manager", "Manages the bakery/deli", "12.50", "15.40", "false"],
        ["Assistant Manager", "Assistant Manager", "12.50", "16.25", "false"],
        ["Market Manager", "Manages the meat department", "15.00", "21.60", "false"],
        ["3rd Key", "3rd key-carrier in a store", "10.00", "12.50", "false"],
        ["4th Key", "4th key-carrier in a store", "8.25", "12.00", "false"],
        ["Manager", "Manager of a store", "16.25", "24.00", "true"],
        ["Perishables Specialist", "Oversees perishables in multiple stores", "19.23", "21.63", "true"],
        ["Supervisor", "Oversees multiple stores", "21.15", "28.84", "true"]
      ]
      positions.each do |position_values|
        Position.create(Hash[keys.zip(position_values)])
      end
  end

  def down
  end
end
