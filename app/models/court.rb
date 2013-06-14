class Court < ActiveRecord::Base
  attr_accessible :blob, :category, :name, :state
  serialize :blob
end
