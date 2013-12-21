require "spec_helper"

describe User do
	context "validations" do 
		let(:user) { build(:user) }
		it "validates" do 
			expect(user).to be_valid
		end
	end
end