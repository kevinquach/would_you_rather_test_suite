require 'spec_helper'

feature 'user votes on question', %{
  As a user
  I want to vote on a question
  So that I can express my view
} do

  let(:question) { FactoryGirl.create(:question_with_options) }

  scenario 'user votes on a question' do
    vote_count = question.votes.count
    visit question_path(question)
    click_on question.options.first.content

    expect(question.votes.count).to eql(vote_count + 1)
  end
  
  scenario 'user can only vote once per question' do
    pending 'this is noncore only attempt when the rest are green'
    visit question_path(question)
    click_on question.options.first.content

    expect(page).to_not have_selector('#new_vote')
  end
end
