require File.dirname(__FILE__) + '/../test_helper'

class CourseworksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:courseworks)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_coursework
    assert_difference('Coursework.count') do
      post :create, :coursework => { }
    end

    assert_redirected_to coursework_path(assigns(:coursework))
  end

  def test_should_show_coursework
    get :show, :id => courseworks(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => courseworks(:one).id
    assert_response :success
  end

  def test_should_update_coursework
    put :update, :id => courseworks(:one).id, :coursework => { }
    assert_redirected_to coursework_path(assigns(:coursework))
  end

  def test_should_destroy_coursework
    assert_difference('Coursework.count', -1) do
      delete :destroy, :id => courseworks(:one).id
    end

    assert_redirected_to courseworks_path
  end
end
