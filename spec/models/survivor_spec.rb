require 'rails_helper'

RSpec.describe Survivor, type: :model do
  subject { described_class.new } # dado

  context "when create" do
    context "has valid" do
      it "should return true" do
        subject.name = "User 1"
        subject.age = Random.rand(100)
        subject.gender = [0, 1, 2].sample
        status = Survivor.statuses.keys.first

        expect(subject.save).to be_truthy
        expect(subject.status).to eql status
      end
    end

    context "has not valid" do
      it "should not save with null name" do
        expect(subject.save).to be_falsey
      end
  
      it "should not save with empty name" do
        subject.name = ""
  
        expect(subject.save).to be_falsey
      end

      it "should not save with null age" do
        subject.name = "User 1"
  
        expect(subject.save).to be_falsey
      end

      it "should not save gender with invalid string" do              
        expect {
          subject.gender = 'invalid'
        }.to raise_error(ArgumentError)
      end
      
      it "should not save gender with invalid enum" do
        expect {
          subject.gender = 4
        }.to raise_error(ArgumentError)
      end
    end
  end
end
