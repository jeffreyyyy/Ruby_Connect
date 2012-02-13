class Question < ActiveRecord::Base
  has_many :answers
  
  validates :title,   :length => { :within => 3..25 }
  validates :content, :length => { :within => 15..400 }

  paginates_per 10

end

