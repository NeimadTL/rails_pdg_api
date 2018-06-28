require 'rails_helper'

RSpec.describe CommissionCalculator, type: :model do

  it 'pdg_fee should be eql to 450.3 and cover_shifts should be eql to 3' do
    commission = CommissionCalculator.new
    expect(commission.pdg_fee).to eql(450.3)
    expect(commission.cover_shifts).to eql(3)
  end

end
