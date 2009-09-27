require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase

  def setup
    @subject = Subject.create(:name => 'Test subject')
  end

  test "should get index" do
    get :index, :subject_id => @subject.id
    assert_response :success
    assert_not_nil assigns(:resources)
  end

  test "should get new" do
    get :new, :subject_id => @subject.id
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post :create, :subject_id => @subject.id, :resource => { }
    end

    assert assigns(:resource)
    assert_redirected_to subject_path(@subject)
  end

  test "should show resource" do
    get :show, :subject_id => @subject.id, :id => resources(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :subject_id => @subject.id, :id => resources(:one).to_param
    assert_response :success
  end

  test "should update resource" do
    resource = @subject.resources.build
    resource.save

    put :update, :subject_id => @subject.id, :id => resource.id, :resource => { }

    assert_redirected_to subject_path(@subject)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete :destroy, :subject_id => @subject.id, :id => resources(:one).to_param
    end

    assert_redirected_to subject_path(@subject)
  end
end
