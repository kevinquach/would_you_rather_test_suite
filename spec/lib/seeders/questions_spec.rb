require 'spec_helper'

describe Seeders::Questions do
  let(:seeder) { Seeders::Questions }

  it 'seeds questions' do
    seeded_question = Seeders::Questions.questions.first[0]
    seeder.seed
    expect(Question.where(description: seeded_question)).to be_present
  end

  it 'seeds question options' do
    seed = Seeders::Questions.questions.first

    # I'm doing a little destructuring here
    # so you all will have seen it
    # technique picked up here:
    # http://globaldev.co.uk/2013/09/ruby-tips-part-2/
    question, option1, option2 = *seed.flatten

    seeder.seed
    seeded_option = Option.find_by(content: option1)
    seeded_question = Question.find_by(description: question)
    expect(seeded_question.options).to include(seeded_option)
  end

  it 'does not create duplicates' do
    seeder.seed
    count_after_seed = Question.count
    seeder.seed
    expect(Question.count).to eql(count_after_seed)
  end
end

