require "spec_helper"

describe BibleVersesController do
  before do
    @bible_verse = FactoryGirl.create(:bible_verse)
    sign_in FactoryGirl.create(:user)
  end

  it "get index" do
    get :index
    expect(response).to be_success    
  end

  it "show bible_verse" do
    get :show, id: @bible_verse
    expect(response).to be_success
  end
end
