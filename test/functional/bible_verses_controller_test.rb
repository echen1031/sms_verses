require 'test_helper'

class BibleVersesControllerTest < ActionController::TestCase
  setup do
    @bible_verse = bible_verses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bible_verses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bible_verse" do
    assert_difference('BibleVerse.count') do
      post :create, bible_verse: { book: @bible_verse.book, book_num: @bible_verse.book_num, chapter_num: @bible_verse.chapter_num, content: @bible_verse.content, reference: @bible_verse.reference, verse_num: @bible_verse.verse_num }
    end

    assert_redirected_to bible_verse_path(assigns(:bible_verse))
  end

  test "should show bible_verse" do
    get :show, id: @bible_verse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bible_verse
    assert_response :success
  end

  test "should update bible_verse" do
    put :update, id: @bible_verse, bible_verse: { book: @bible_verse.book, book_num: @bible_verse.book_num, chapter_num: @bible_verse.chapter_num, content: @bible_verse.content, reference: @bible_verse.reference, verse_num: @bible_verse.verse_num }
    assert_redirected_to bible_verse_path(assigns(:bible_verse))
  end

  test "should destroy bible_verse" do
    assert_difference('BibleVerse.count', -1) do
      delete :destroy, id: @bible_verse
    end

    assert_redirected_to bible_verses_path
  end
end
