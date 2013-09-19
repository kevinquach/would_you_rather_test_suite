class Vote < ActiveRecord::Base
  validates_presence_of :option

  belongs_to :option,
    inverse_of: :votes
end
