class Tree < ActiveRecord::Base

  validates_presence_of :species

  belongs_to :user
  belongs_to :species

end