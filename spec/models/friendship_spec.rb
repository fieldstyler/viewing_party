require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "relationships" do
    it {should belong_to(:friend)}
  end
end
