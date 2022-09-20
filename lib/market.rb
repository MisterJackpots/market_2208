class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    selling_vendors = []
    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item)
        selling_vendors << vendor
      end
    end
    selling_vendors
  end

  def sorted_item_list
    list_of_items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        list_of_items << item.name
      end
    end
    list_of_items.uniq.sort
  end

  def total_inventory
    all_inventory_items = Hash.new
    
  end

end