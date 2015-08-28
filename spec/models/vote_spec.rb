require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values"
        expect( Vote.create(value: 1) ).to eq(true)
        expect( Vote.create(value: -1) ).to eq(true)
        expect( Vote.create(value: 3) ).to eq(false)
      end
    end
  end
end
      