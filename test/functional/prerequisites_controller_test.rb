require 'test_helper'

class PrerequisitesControllerTest < ActionController::TestCase

  def setup
    @subject = Subject.create(:name => 'Test subject')
  end

  test "should get index" do
    get :index, :subject_id => @subject.id
    assert_response :success
    assert_not_nil assigns(:prerequisites)
  end

  test "should get new" do
    get :new, :subject_id => @subject.id
    assert_response :success
  end

  test "should create prerequisite" do
    assert_difference('Prerequisite.count') do
      post :create, :subject_id => @subject.id, :prerequisite => { }
    end

    assert_redirected_to subject_path(@subject)
  end

  test "should destroy prerequisite" do
    assert_difference('Prerequisite.count', -1) do
      delete :destroy, :subject_id => @subject.id, :id => prerequisites(:one).to_param
    end

    assert_redirected_to subject_path(@subject)
  end
end
