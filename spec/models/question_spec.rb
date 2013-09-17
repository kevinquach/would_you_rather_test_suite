require 'spec_helper'

describe Question do
  it { should validate_presence_of :description }
  it { should have_many :options }

  describe 'most popular' do
    let(:question) {       FactoryGirl.create(:question_with_options) }
    let(:popular_option) { question.options.first }
    let(:other_option) {   question.options.last }
    let(:vote) {           FactoryGirl.create(:vote, option: popular_option) }
    let(:vote2) {          FactoryGirl.create(:vote, option: popular_option) }

    it 'returns the most popular option' do
      vote
      vote2
      expect(question.most_popular_option).to eql(popular_option)
    end

    it 'returns nil if no most popular option' do
      question
      expect(question.most_popular_option).to eql(nil)
    end
  end
end

