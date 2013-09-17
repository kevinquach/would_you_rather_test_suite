require 'spec_helper'

describe Vote do
  it { should validate_presence_of :option }

  it { should belong_to :option }
end
