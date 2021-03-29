require 'rails_helper'

RSpec.describe "item_attributes/new", type: :view do
  before(:each) do
    assign(:item_attribute, ItemAttribute.new())
  end

  it "renders new item_attribute form" do
    render

    assert_select "form[action=?][method=?]", item_attributes_path, "post" do
    end
  end
end
