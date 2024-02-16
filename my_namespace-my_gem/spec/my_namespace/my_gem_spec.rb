# frozen_string_literal: true

RSpec.describe MyNamespace::MyGem do
  it "has a version number" do
    expect(MyNamespace::MyGem::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
