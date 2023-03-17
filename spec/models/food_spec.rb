require_relative '../rails_helper'

RSpec.describe Food, type: :model do
    
    subject do 
        user = User.new(name: 'Zia')
        Food.new(name: 'chicken', measurement_unit: 'grams', price: 10.0)
    end

    before { subject.save }

    it 'name must be present' do 
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'name should be chicken' do
        expect(subject.name).to eql 'chicken'
    end

    it 'measurement_unit must be present' do 
        subject.measurement_unit = nil
        expect(subject).to_not be_valid
    end

    it 'measurement_unit should be grams' do
        expect(subject.measurement_unit).to eql 'grams'
    end

    it 'price must be present' do 
        subject.price = nil
        expect(subject).to_not be_valid
    end

    it 'price should be grams' do
        expect(subject.price).to eql 10.0
    end

    it 'price  should be greater than zero' do
        subject.price = -20
        expect(subject).to_not be_valid
      end

end