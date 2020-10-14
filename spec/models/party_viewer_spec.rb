require 'rails_helper'

RSpec.describe PartyViewer, type: :model do
  describe "relationships" do
    it {should belong_to(:party)}
    it {should belong_to(:user)}
  end
end
