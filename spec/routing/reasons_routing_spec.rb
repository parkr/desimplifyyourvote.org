require "spec_helper"

describe ReasonsController do
  describe "routing" do

    it "routes to #index" do
      get("/reasons").should route_to("reasons#index")
    end

    it "routes to #new" do
      get("/reasons/new").should route_to("reasons#new")
    end

    it "routes to #show" do
      get("/reasons/1").should route_to("reasons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reasons/1/edit").should route_to("reasons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reasons").should route_to("reasons#create")
    end

    it "routes to #update" do
      put("/reasons/1").should route_to("reasons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reasons/1").should route_to("reasons#destroy", :id => "1")
    end

  end
end
