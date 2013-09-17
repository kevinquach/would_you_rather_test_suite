class Question < ActiveRecord::Base
  has_many :votes,
    through: :options

  has_many :options,
    inverse_of: :question,
    dependent: :destroy

  validates_presence_of :description

  accepts_nested_attributes_for :options

  class << self
    def most_active
    end
  end

  def most_popular_option
    "hmmmm"
  end
end
