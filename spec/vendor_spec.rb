require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'exists' do
    expect(@vendor).to be_an_instance_of(Vendor)
  end

  it 'has readable attributes' do
    expect(@vendor.name).to eq('Rocky Mountain Fresh')
    expect(@vendor.inventory).to eq({})
  end

  it 'can check stock of an item' do
    expect(@vendor.check_stock(@item1)).to eq(0)
  end

  it 'can stock an item' do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item2, 12)
    
    expect(@vendor.inventory).to eq({@item1 => 30, @item2 => 12})
    expect(@vendor.check_stock(@item1)).to eq(30)
    expect(@vendor.check_stock(@item2)).to eq(12)
  end

  it 'can increase quantity of stocked item' do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)

    expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    expect(@vendor.check_stock(@item1)).to eq(55)
    expect(@vendor.check_stock(@item2)).to eq(12)
  end
end