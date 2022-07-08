require "test_helper"

class Public::DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_documents_new_url
    assert_response :success
  end

  test "should get index" do
    get public_documents_index_url
    assert_response :success
  end

  test "should get show" do
    get public_documents_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_documents_edit_url
    assert_response :success
  end

  test "should get word_search" do
    get public_documents_word_search_url
    assert_response :success
  end

  test "should get tag_search" do
    get public_documents_tag_search_url
    assert_response :success
  end
end
