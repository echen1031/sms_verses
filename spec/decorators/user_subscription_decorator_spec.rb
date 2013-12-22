require 'spec_helper'

describe UserSubscriptionDecorator do
	let(:user_subscription) { create(:user_subscription, 
			remind_hour: 8, send_day_1: true, send_day_4: true) }
  let(:decorated_user_subscription ) { UserSubscriptionDecorator.decorate(user_subscription) }

	it "returns normal hour" do 
		expect(decorated_user_subscription.readable_hour).to eq ' 8 am'
	end

	it "returns random hour" do 
		user_subscription.remind_hour = 99 
		expect(decorated_user_subscription.readable_hour).to eq 'Random'
	end
	
  it "return friendly days" do 
  	expect(decorated_user_subscription.subscription_days).to eq 'Sun Wed'
  end
end
