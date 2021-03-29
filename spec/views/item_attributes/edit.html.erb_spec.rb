require 'rails_helper'

RSpec.describe "item_attributes/edit", type: :view do
  before(:each) do
    @item_attribute = assign(:item_attribute, ItemAttribute.create!())
  end

  it "renders the edit item_attribute form" do
    render

    assert_select "form[action=?][method=?]", item_attribute_path(@item_attribute), "post" do
    end
  end
end
