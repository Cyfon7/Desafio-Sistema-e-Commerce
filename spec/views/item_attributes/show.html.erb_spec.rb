require 'rails_helper'

RSpec.describe "item_attributes/show", type: :view do
  before(:each) do
    @item_attribute = assign(:item_attribute, ItemAttribute.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
