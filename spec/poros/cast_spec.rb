require "rails_helper"

RSpec.describe Cast do
  it "exists" do
    attr = {
      name: "John Smith",
      character: "John Smith"
    }

    cast = Cast.new(attr)
    expect(cast).to be_a(Cast)
    expect(cast.name).to eq("John Smith")
    expect(cast.character).to eq("John Smith")
  end

end
