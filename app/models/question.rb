require 'pry-rails'

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
    votes_array = self.options.map{|option| option.votes.count}

    if votes_array[0] > votes_array[1]
      self.options.first
    elsif votes_array[0] < votes_array[1]
      self.options.last
    else
      nil
    end
  end 
end
