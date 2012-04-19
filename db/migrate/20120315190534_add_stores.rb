class AddStores < ActiveRecord::Migration
  def up
    store_names = ["Springhill", "Homer", "Haynesville", "Plain Dealing", "Texarkana, AR", "Magnolia", "Marshall", "Lakeshore",
                   "Linwood", "Minden", "Hope", "Camden", "Natchitoches", "Pine Bluff", "Texarkana, TX", "Little Rock", "McAlester", "North Little Rock"]
    store_names.each do |name|
      Store.create(:name => name)
    end
  end

  def down
  end
end
