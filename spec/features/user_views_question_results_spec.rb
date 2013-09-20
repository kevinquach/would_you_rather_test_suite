require 'spec_helper'

feature 'user views the results of a question', %q{
  As a user
  I want to view the results of a would you rather
  So that I can see how others voted
} do

  let(:question) { FactoryGirl.create(:question_with_options, created_at: Time.now - 1.week) }
  let(:question2) { FactoryGirl.create(:question_with_options, created_at: Time.now - 1.year) }
  let(:question3) { FactoryGirl.create(:question_with_options) }
  let(:option1) { question.options.first }
  let(:option2) { question.options.last }

  before(:each) do
    question
    visit question_path(question)
    click_on option1.content
  end

  scenario 'shows total votes' do
    expect(page).to have_content "#{question.votes.count} total vote submitted"
    click_on option2.content
    click_on option2.content
    expect(page).to have_content "#{question.votes.count} total votes submitted"
  end

  scenario 'shows vote percentages by option' do
    expect(page).to have_content "#{option1.content} was chosen 100% of the time"
    expect(page).to have_content "#{option2.content} was chosen 0% of the time"
    click_on option2.content
    click_on option2.content
    expect(page).to have_content "#{option1.content} was chosen 33% of the time"
    expect(page).to have_content "#{option2.content} was chosen 66% of the time"
  end

  scenario 'shows most active question (most votes) on homepage' do
    question2
    question3
    
    visit root_path
    expect(page).to have_content "Currently the most active question is #{question.description}"
  end
end

