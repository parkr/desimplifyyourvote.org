class Reason < ActiveRecord::Base
  attr_accessible :critique, :response_id, :why
  
  belong_to :response
end
