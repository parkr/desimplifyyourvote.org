require "spec_helper"

describe ResponsesController do
  describe "routing" do
    it "routes to #new" do
      get("/responses/new").should route_to("responses#new")
    end
    
    it "routes to #create" do
      post("/responses").should route_to("responses#create")
    end
  end
end
