require "spec_helper"

describe User do
  context "validations" do 
    let(:user) { build(:user) }

    it "validates" do 
      expect(user).to be_valid
    end

    it "validates an email address" do
      user.email = " "
      expect(user).to_not be_valid
    end

    it "validates the format of an email address" do
      user.email = "ericchen"
      user.valid?.should == false
    end
  end

  context "sending emails and text messages" do 
    let(:user) { create(:user) }

    it "enqueues email job" do 
        user.phone = nil
        expect(EmailVerseWorker).to receive(:perform_async)
        user.send_now
    end

    it "enqueues text messag job" do 
        expect(TextVerseWorker).to receive(:perform_async)
        user.send_now
    end
  end
end
