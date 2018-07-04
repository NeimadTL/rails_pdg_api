require 'rails_helper'

RSpec.describe Worker, type: :model do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :status }
  it { should validate_inclusion_of(:status).in_array(
    [Worker::MEDIC_STATUS, Worker::INTERN_STATUS, Worker::COVER_STATUS]
  )}

  it { should have_many(:shifts) }

end
