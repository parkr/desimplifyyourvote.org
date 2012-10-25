class Reason < ActiveRecord::Base
  attr_accessible :critique, :response_id, :why
  
  validate do |reason|
    errors.add(:base, "Must include at least one of: critique, reason.") unless !(reason.critique.empty? && reason.why.empty?)
  end
  
  belongs_to :response
end