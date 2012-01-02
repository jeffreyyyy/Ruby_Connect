class Admin < ActiveRecord::Base
  attr_accessible :name, :email
end
