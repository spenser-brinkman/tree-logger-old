class Tree < ActiveRecord::Base

  validates_presence_of :species

  belongs_to :tree

end