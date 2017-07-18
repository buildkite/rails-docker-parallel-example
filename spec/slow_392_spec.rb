require 'spec_helper'

RSpec.describe "A slow spec" do
  it "runs for 1 minute in parallel" do
    sleep 120
    expect(1).to eql(1)
  end
end