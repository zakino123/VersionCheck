require "rails_helper"

RSpec.describe WeightHistroysController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/weight_histroys").to route_to("weight_histroys#index")
    end

    it "routes to #new" do
      expect(get: "/weight_histroys/new").to route_to("weight_histroys#new")
    end

    it "routes to #show" do
      expect(get: "/weight_histroys/1").to route_to("weight_histroys#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/weight_histroys/1/edit").to route_to("weight_histroys#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/weight_histroys").to route_to("weight_histroys#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/weight_histroys/1").to route_to("weight_histroys#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/weight_histroys/1").to route_to("weight_histroys#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/weight_histroys/1").to route_to("weight_histroys#destroy", id: "1")
    end
  end
end
