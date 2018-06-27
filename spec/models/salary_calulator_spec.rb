require 'rails_helper'

RSpec.describe SalaryCalculator, type: :model do

  describe "SalaryCalculator#salary for a worker" do
    it 'returns 270 when it is a medic with one shift' do
      john = Worker.create!(first_name: 'John', status: 'medic')
      john.shifts << Shift.create!(worker_id: john.id, start_date: '2017-1-2')
      expected_salary = SalaryCalculator.instance.salary(john)
      expect(expected_salary).to eql(270)
    end

    it 'returns 540 when it is a medic with one shift on weekend' do
      dan = Worker.create!(first_name: 'Dan', status: 'medic')
      dan.shifts << Shift.create!(worker_id: dan.id, start_date: '2017-1-1')
      expected_salary = SalaryCalculator.instance.salary(dan)
      expect(expected_salary).to eql(540)
    end

    it 'returns 126 when it is an intern with one shift' do
      rebecca = Worker.create!(first_name: 'Rebecca', status: 'intern')
      rebecca.shifts << Shift.create!(worker_id: rebecca.id, start_date: '2017-1-2')
      expected_salary = SalaryCalculator.instance.salary(rebecca)
      expect(expected_salary).to eql(126)
    end

    it 'returns 252 when it is an intern with one shift on weekend' do
      sarah = Worker.create!(first_name: 'Sarah', status: 'intern')
      sarah.shifts << Shift.create!(worker_id: sarah.id, start_date: '2017-1-1')
      expected_salary = SalaryCalculator.instance.salary(sarah)
      expect(expected_salary).to eql(252)
    end

    it 'returns 480 when it is a cover with one shift' do
      gary = Worker.create!(first_name: 'Gary', status: 'cover')
      gary.shifts << Shift.create!(worker_id: gary.id, start_date: '2017-1-2')
      expected_salary = SalaryCalculator.instance.salary(gary)
      expect(expected_salary).to eql(480)
    end

    it 'returns 960 when it is a cover with one shift on weekend' do
      alexey = Worker.create!(first_name: 'Alexey', status: 'cover')
      alexey.shifts << Shift.create!(worker_id: alexey.id, start_date: '2017-1-1')
      expected_salary = SalaryCalculator.instance.salary(alexey)
      expect(expected_salary).to eql(960)
    end
  end

end
