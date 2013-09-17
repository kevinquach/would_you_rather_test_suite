require 'spec_helper'

describe Option do
  it { should validate_presence_of :content }

  it { should have_many :votes }
  it { should belong_to :question }
end
