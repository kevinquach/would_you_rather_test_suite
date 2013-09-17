require 'spec_helper'

feature 'user adds a question', %q{
  As a user
  I want to add a question
  So that I can poll the world
} do

  scenario 'a user adds a question with options' do
    question_count = Question.count
    visit root_path
    click_on 'add new question'
    fill_in 'Description', with: 'Super Famous'

    fill_in 'Option 1', with: 'Be famous for inventing the Whoopie Cushion'
    fill_in 'Option 2', with: 'Be famous for inventing snap bracelets'
    click_on 'Create Question'

    expect(Question.count).to eql(question_count + 1)
    expect(Question.last.options.count).to eql(2)
  end

  scenario 'a user attempts to create a question without description'  do
    question_count = Question.count
    visit root_path
    click_on 'add new question'

    click_on 'Create Question'

    expect(page).to have_content "can't be blank"
    expect(Question.count).to eql(question_count)
  end
end

