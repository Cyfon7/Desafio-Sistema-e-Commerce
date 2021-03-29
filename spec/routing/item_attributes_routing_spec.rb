require "rails_helper"

RSpec.describe ItemAttributesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/item_attributes").to route_to("item_attributes#index")
    end

    it "routes to #new" do
      expect(get: "/item_attributes/new").to route_to("item_attributes#new")
    end

    it "routes to #show" do
      expect(get: "/item_attributes/1").to route_to("item_attributes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/item_attributes/1/edit").to route_to("item_attributes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/item_attributes").to route_to("item_attributes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/item_attributes/1").to route_to("item_attributes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/item_attributes/1").to route_to("item_attributes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/item_attributes/1").to route_to("item_attributes#destroy", id: "1")
    end
  end
end
