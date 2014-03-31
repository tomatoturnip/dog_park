require 'spec_helper'

describe RegisterDog do
  let(:registration) { RegisterDog.new }
  context 'validations' do
    it 'requires a first name' do
      expect(registration).to_not be_valid
      expect(registration.errors[:first_name]).to be_present
    end

    it 'requires a last name' do
      expect(registration).to_not be_valid
      expect(registration.errors[:last_name]).to be_present
    end

    it 'requires an email' do
      expect(registration).to_not be_valid
      expect(registration.errors[:email]).to be_present
    end

    it 'requires a dog\'s name' do
      expect(registration).to_not be_valid
      expect(registration.errors[:dog_name]).to be_present
    end
  end
end
