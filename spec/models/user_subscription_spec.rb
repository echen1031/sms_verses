require "spec_helper"

describe UserSubscription do
	context "validations" do 
		let(:user_subscription) { create(:user_subscription) }
		it "validates" do 
			expect(user_subscription).to be_valid
		end
	end

	context "sending emails and text messages" do 
		let(:user_subscription) { create(:user_subscription) }
		it "enqueues email job" do 
			user_subscription.phone = nil
			expect(EmailVerseWorker).to receive(:perform_async)
			user_subscription.send_now
		end

		it "enqueues text messag job" do 
			expect(TextVerseWorker).to receive(:perform_async)
			user_subscription.send_now
		end
	end
end