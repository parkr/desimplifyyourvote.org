class Response < ActiveRecord::Base
  attr_accessible :ip_address, :user_agent, :who
  
  has_many :reasons
end
