require 'test_helper'

class DogPicturesControllerTest < ActionController::TestCase
  setup do
    @dog_picture = dog_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dog_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dog_picture" do
    assert_difference('DogPicture.count') do
      post :create, dog_picture: { name: @dog_picture.name, url: @dog_picture.url }
    end

    assert_redirected_to dog_picture_path(assigns(:dog_picture))
  end

  test "should show dog_picture" do
    get :show, id: @dog_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dog_picture
    assert_response :success
  end

  test "should update dog_picture" do
    patch :update, id: @dog_picture, dog_picture: { name: @dog_picture.name, url: @dog_picture.url }
    assert_redirected_to dog_picture_path(assigns(:dog_picture))
  end

  test "should destroy dog_picture" do
    assert_difference('DogPicture.count', -1) do
      delete :destroy, id: @dog_picture
    end

    assert_redirected_to dog_pictures_path
  end
end
