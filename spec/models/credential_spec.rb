require 'rails_helper'

RSpec.describe Credential, type: :model do
  let(:establishment) { create :establishment }
  let(:login) { Faker::Internet.email }
  let(:password) { Faker::Alphanumeric.alpha(number: 10) }
  it 'is valid with attributes' do
    credential = Credential.create(login: login,
                                   password: password)
    expect(credential).to be_valid
  end

  it 'is not valid without login' do
    credential = Credential.create(password: password)
    expect(credential).to_not be_valid
  end

  it 'is not valid without password' do
    credential = Credential.create(login: login)
    expect(credential).to_not be_valid
  end

  it 'is not valid wit same login' do
    credential = Credential.create(login: login,
                                   password: password)
    expect(credential).to be_valid
    new_credential = Credential.create(login: login,
                                       password: 'other' + password)
    expect(new_credential).to_not be_valid
  end
end
