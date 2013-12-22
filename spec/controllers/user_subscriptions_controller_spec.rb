require 'spec_helper'

describe UserSubscriptionsController do
  before do
    @user_subscription = FactoryGirl.create(:user_subscription)
    sign_in @user_subscription.user
  end

  it "get index" do
    get :index, user_id: @user_subscription.user.id
    expect(response).to be_success
    assert_not_nil assigns(:user_subscriptions)
  end

  it "get new" do
    get :new, user_id: @user_subscription.user.id
    expect(response).to be_success
  end

  it "create user_subscription" do
    new_user_subscription = FactoryGirl.build(:user_subscription, user: @user_subscription.user )

    post :create, user_id: @user_subscription.user.id,
      user_subscription: { 
        email: new_user_subscription.email,
        phone: new_user_subscription.phone, 
        remind_hour: new_user_subscription.remind_hour,
        phone_carrier: @user_subscription.phone_carrier,
        send_day_1: true }        
    expect(response).to redirect_to user_user_subscriptions_path(@user_subscription.user)
  end

  it "show user_subscription" do
    get :show, user_id: @user_subscription.user.id, id: @user_subscription
    expect(response).to be_success
  end

  it "get edit" do
    get :edit, user_id: @user_subscription.user.id, id: @user_subscription
    expect(response).to be_success
  end

  it "update user_subscription" do
    put :update, user_id: @user_subscription.user.id, id: @user_subscription, 
      user_subscription: {
          email: @user_subscription.email,
          phone: @user_subscription.phone,
          remind_hour: @user_subscription.remind_hour,
          phone_carrier: @user_subscription.phone_carrier }

    expect(response).to redirect_to user_user_subscriptions_path(@user_subscription.user)    
  end

  it "destroy user_subscription" do
    delete :destroy, user_id: @user_subscription.user.id, id: @user_subscription    
    assert_redirected_to user_user_subscriptions_path(@user_subscription.user)    
  end
end
