require 'spec_helper'

describe UserDecorator do
  let(:user) { create(:user, remind_hour: 8, send_day_1: true, send_day_4: true) }
  let(:decorated_user ) { UserDecorator.decorate(user) }

  it "returns normal hour" do 
    expect(decorated_user.readable_hour).to eq ' 8 am'
  end

  it "returns random hour" do 
    user.remind_hour = 99 
    expect(decorated_user.readable_hour).to eq 'Random'
  end

  it "return friendly days" do 
    expect(decorated_user.subscription_days).to eq 'Sun Wed'
  end
end
