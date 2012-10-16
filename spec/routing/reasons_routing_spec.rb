require "spec_helper"

describe ReasonsController do
  describe "routing" do

    it "routes to #new" do
      get("/reasons/new").should route_to("reasons#new")
    end

    it "routes to #create" do
      post("/reasons").should route_to("reasons#create")
    end

  end
end
