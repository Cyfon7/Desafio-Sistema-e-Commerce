require 'rails_helper'

RSpec.describe "item_attributes/index", type: :view do
  before(:each) do
    assign(:item_attributes, [
      ItemAttribute.create!(),
      ItemAttribute.create!()
    ])
  end

  it "renders a list of item_attributes" do
    render
  end
end
