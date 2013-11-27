require 'test_helper'

class VerseReferencesControllerTest < ActionController::TestCase
  setup do
    @verse_reference = verse_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verse_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verse_reference" do
    assert_difference('VerseReference.count') do
      post :create, verse_reference: { book: @verse_reference.book, chapter: @verse_reference.chapter, content: @verse_reference.content, verse_number: @verse_reference.verse_number }
    end

    assert_redirected_to verse_reference_path(assigns(:verse_reference))
  end

  test "should show verse_reference" do
    get :show, id: @verse_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verse_reference
    assert_response :success
  end

  test "should update verse_reference" do
    put :update, id: @verse_reference, verse_reference: { book: @verse_reference.book, chapter: @verse_reference.chapter, content: @verse_reference.content, verse_number: @verse_reference.verse_number }
    assert_redirected_to verse_reference_path(assigns(:verse_reference))
  end

  test "should destroy verse_reference" do
    assert_difference('VerseReference.count', -1) do
      delete :destroy, id: @verse_reference
    end

    assert_redirected_to verse_references_path
  end
end
