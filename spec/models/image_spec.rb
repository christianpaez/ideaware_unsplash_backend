require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "image model validations" do
    it "should validate presence of required fields" do
      should validate_presence_of(:description)
      should validate_presence_of(:url)
      should validate_presence_of(:unsplash_id)
      should validate_presence_of(:html)
    end
  end
end