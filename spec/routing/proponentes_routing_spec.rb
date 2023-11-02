require "rails_helper"

RSpec.describe ProponentesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/proponentes").to route_to("proponentes#index")
    end

    it "routes to #new" do
      expect(get: "/proponentes/new").to route_to("proponentes#new")
    end

    it "routes to #show" do
      expect(get: "/proponentes/1").to route_to("proponentes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/proponentes/1/edit").to route_to("proponentes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/proponentes").to route_to("proponentes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/proponentes/1").to route_to("proponentes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/proponentes/1").to route_to("proponentes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/proponentes/1").to route_to("proponentes#destroy", id: "1")
    end
  end
end
