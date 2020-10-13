require "rails_helper"

RSpec.describe Actor do
  it "exists" do
    attr = {
      name: "John Smith",
      character: "John Smith"
    }

    actor = Actor.new(attr)
    expect(actor).to be_a(Actor)
    expect(actor.name).to eq("John Smith")
    expect(actor.character).to eq("John Smith")
  end
end
