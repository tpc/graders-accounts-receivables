require File.dirname(__FILE__) + '/../test_helper'

class GradersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:graders)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_grader
    assert_difference('Grader.count') do
      post :create, :grader => { }
    end

    assert_redirected_to grader_path(assigns(:grader))
  end

  def test_should_show_grader
    get :show, :id => graders(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => graders(:one).id
    assert_response :success
  end

  def test_should_update_grader
    put :update, :id => graders(:one).id, :grader => { }
    assert_redirected_to grader_path(assigns(:grader))
  end

  def test_should_destroy_grader
    assert_difference('Grader.count', -1) do
      delete :destroy, :id => graders(:one).id
    end

    assert_redirected_to graders_path
  end
end
