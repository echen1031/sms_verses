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

  it "get new" do
    get :new, id: @user.id
    expect(response).to be_success
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
    put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, phone: "4047176779")
      @user.reload
      expect(@user.phone).to eq("14047176779")
      expect(response).to redirect_to user_path(@user)
  end
end
