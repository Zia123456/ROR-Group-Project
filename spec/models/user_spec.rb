require_relative '../rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Zia')}

    before { subject.save }

    it 'name must be present' do 
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'name must be Zia' do 
        expect(subject.name).to eql 'Zia'
    end

end