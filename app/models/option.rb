class Option < ActiveRecord::Base
  has_many :votes,
    inverse_of: :option

  belongs_to :question,
    inverse_of: :options

  validates_presence_of :content


  def chosen_percentage
    0
  end
end
