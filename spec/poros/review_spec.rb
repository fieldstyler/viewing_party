require "rails_helper"

RSpec.describe Review do
  it "exists" do
    attr = {
      author: "Dude",
      content: "I love this movie"
    }

    review = Review.new(attr)
    expect(review).to be_a(Review)
    expect(review.author).to eq("Dude")
    expect(review.content).to eq("I love this movie")
  end
end
