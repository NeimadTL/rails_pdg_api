require 'rails_helper'

RSpec.describe Worker, type: :model do

  it { should validate_presence_of :first_name }
  it { should validate_numericality_of(:price_per_shift).only_integer }
end
