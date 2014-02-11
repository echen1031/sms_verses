require "spec_helper"

describe BibleVerse do
	context "validations" do 
		let(:bible_verse) { FactoryGirl.build(:bible_verse) }
		it "validates" do 
			expect(bible_verse).to be_valid
		end
	end
end
