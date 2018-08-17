require 'rails_helper'

RSpec.describe User, type: :model do
  #associations user has_many goals

describe 'validations' do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
end

describe 'find_by_credentials' do
  let(:james) {create(:user)} #create(:user) is a factory bot syntax, that uses faker

  it 'returns a user with good credentials' do
    expect(User.find_by_credentials(james.username, james.password)).to eq(james)
  end

  it 'returns nil for faulty credentials' do
    expect(User.find_by_credentials(james.username, 'startreck')).to eq(nil)
  end
end

end
