require 'rails_helper'

RSpec.describe Worker, type: :model do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :status }

  it { should have_many(:shifts) }


  describe "#price for a worker" do
    it 'returns 810 when the it is a medic with three shifts' do
      julie = Worker.find_by(first_name: 'Julie')
      expect(julie.price).to eql(270)
    end

    it 'returns 252 when the it is a intern with two shifts' do
      antoine = Worker.find_by(first_name: 'Antoine')
      expect(antoine.price).to eql(630)
    end
  end

end
