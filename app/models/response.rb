class Response < ActiveRecord::Base
  attr_accessible :ip_address, :user_agent, :who
  
  validates_presence_of :ip_address, :user_agent, :who
  validates_inclusion_of :who, :in => ['obama', 'romney', 'independent', 'didnt_vote']
  
  has_many :reasons
  accepts_nested_attributes_for :reasons
end
