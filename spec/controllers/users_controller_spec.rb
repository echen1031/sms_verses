require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "get index" do
    get :index
    expect(response).to be_success
    assert_not_nil assigns(:users)
  end

  it "show user" do
    get :show, id: @user.id
    expect(response).to be_success
  end

  it "get edit" do
    get :edit, id: @user.id
    expect(response).to be_success
  end

  it "update user" do
    put :update, id: @user.id, user: {
      phone: @user.phone,
      remind_hour: @user.remind_hour,
      phone_carrier: @user.phone_carrier }

      expect(response).to redirect_to user_path(@user)    
  end
end