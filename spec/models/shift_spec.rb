require 'rails_helper'

RSpec.describe Shift, type: :model do

  it { should validate_presence_of :start_date }
  it { should belong_to(:worker) }

end
