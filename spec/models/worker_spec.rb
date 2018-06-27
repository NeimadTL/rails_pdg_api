require 'rails_helper'

RSpec.describe Worker, type: :model do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :status }

  it { should have_many(:shifts) }

end
