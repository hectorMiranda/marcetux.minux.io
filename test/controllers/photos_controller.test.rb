require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get photos_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_url
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Picture.count') do
      post photos_url, params: { photo: { body: @photo.body, description: @photo.description, slug: @photo.slug, title: @photo.title } }
    end

    assert_redirected_to photo_url(Picture.last)
  end

  test "should show photo" do
    get photo_url(@photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_url(@photo)
    assert_response :success
  end

  test "should update photo" do
    patch photo_url(@photo), params: { photo: { body: @photo.body, description: @photo.description, slug: @photo.slug, title: @photo.title } }
    assert_redirected_to photo_url(@photo)
  end

  test "should destroy photo" do
    assert_difference('Picture.count', -1) do
      delete photo_url(@photo)
    end

    assert_redirected_to photos_url
  end
end
