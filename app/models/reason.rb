class Reason < ActiveRecord::Base
  attr_accessible :critique, :response_id, :why
  
  validates :critique, :why, :with => Proc.new { |reason| !reason.critique.empty? || !reason.why.empty? }
  
  belongs_to :response
end