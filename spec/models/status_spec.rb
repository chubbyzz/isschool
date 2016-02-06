require 'rails_helper'

RSpec.describe Status, type: :model do
  it 'should already have inactive end active' do
    expect(Status.find_by_name(:inactive)).to_not be_nil
    expect(Status.find_by_name(:active)).to_not be_nil
  end
end
