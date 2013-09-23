class Option < ActiveRecord::Base
  has_many :votes,
    inverse_of: :option

  belongs_to :question,
    inverse_of: :options

  validates_presence_of :content


  def chosen_percentage
    if self.question.votes.count > 0
      percentage = ((self.votes.count.to_f / self.question.votes.count.to_f) * 100).to_i
    end
    percentage
  end
end
