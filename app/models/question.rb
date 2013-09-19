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
      # # order('votes desc').first
      # max_value['question'
      # questions.each do |question|
      #   votes_array = question.options.map{|option| option.votes.count}
      #   sum = votes_array[0] + votes_array[1]
      #   if sum >= max_value[question]
      #     max_value[question] = sum
      #   end
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
