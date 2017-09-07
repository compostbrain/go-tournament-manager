require 'rails_helper'

describe "when rspec is configured properly" do
  it 'should pass' do
    expect(true).to eq(true)
  end

  it 'can fail' do
    expect(false).to eq true
  end
end
