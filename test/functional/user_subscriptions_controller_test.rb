require 'test_helper'

class UserSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @user_subscription = user_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_subscription" do
    assert_difference('UserSubscription.count') do
      post :create, user_subscription: { created_at: @user_subscription.created_at, email: @user_subscription.email, is_active: @user_subscription.is_active, phone: @user_subscription.phone, remind_at: @user_subscription.remind_at, updated_at: @user_subscription.updated_at, verse_count: @user_subscription.verse_count }
    end

    assert_redirected_to user_subscription_path(assigns(:user_subscription))
  end

  test "should show user_subscription" do
    get :show, id: @user_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_subscription
    assert_response :success
  end

  test "should update user_subscription" do
    put :update, id: @user_subscription, user_subscription: { created_at: @user_subscription.created_at, email: @user_subscription.email, is_active: @user_subscription.is_active, phone: @user_subscription.phone, remind_at: @user_subscription.remind_at, updated_at: @user_subscription.updated_at, verse_count: @user_subscription.verse_count }
    assert_redirected_to user_subscription_path(assigns(:user_subscription))
  end

  test "should destroy user_subscription" do
    assert_difference('UserSubscription.count', -1) do
      delete :destroy, id: @user_subscription
    end

    assert_redirected_to user_subscriptions_path
  end
end
