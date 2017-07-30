require 'test_helper'

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translation = translations(:one)
  end

  test "should get index" do
    get translations_url
    assert_response :success
  end

  test "should get new" do
    get new_translation_url
    assert_response :success
  end

  test "should create translation" do
    assert_difference('Translation.count') do
      post translations_url, params: { translation: { contributors_id: @translation.contributors_id, name: @translation.name, original_content_id: @translation.original_content_id, owner_id: @translation.owner_id, priority: @translation.priority, source_lang: @translation.source_lang, source_url: @translation.source_url, status: @translation.status, translated_contents_id: @translation.translated_contents_id } }
    end

    assert_redirected_to translation_url(Translation.last)
  end

  test "should show translation" do
    get translation_url(@translation)
    assert_response :success
  end

  test "should get edit" do
    get edit_translation_url(@translation)
    assert_response :success
  end

  test "should update translation" do
    patch translation_url(@translation), params: { translation: { contributors_id: @translation.contributors_id, name: @translation.name, original_content_id: @translation.original_content_id, owner_id: @translation.owner_id, priority: @translation.priority, source_lang: @translation.source_lang, source_url: @translation.source_url, status: @translation.status, translated_contents_id: @translation.translated_contents_id } }
    assert_redirected_to translation_url(@translation)
  end

  test "should destroy translation" do
    assert_difference('Translation.count', -1) do
      delete translation_url(@translation)
    end

    assert_redirected_to translations_url
  end
end
