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
      @most_active = []
      hash = {}
      Question.all.each do |question|
        question.options.each do |option|
          unless hash.has_key?(option.question_id)
            hash[option.question_id] = 0
          end
          hash[option.question_id] += option.votes.count
        end
      end

      sorted_hash = hash.sort_by{ |question_id, vote_sum| vote_sum }
      
      most_active_question_id = sorted_hash.last[0]
      
      @most_active = Question.where('id = ?', most_active_question_id).first
      binding.pry
      @most_active
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
