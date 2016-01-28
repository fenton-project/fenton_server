require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test 'should route to project list' do
    assert_routing '/projects', controller: 'projects', action: 'index'
  end

  test 'should route to a project' do
    assert_routing '/projects/1', controller: 'projects',
                                  action: 'show', id: '1'
  end

  # TODO: Get serializer project test working
  # test "should render project serializer" do
  #   get :index
  #   assert_serializer "ProjectSerializer"
  # end

  test 'should get index' do
    get projects_url
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url, params: {
        project: {
          description: @project.description, name: @project.name,
          passphrase: @project.passphrase,
          organization_id: @project.organization_id,
          key: @project.key
        }
      }
    end

    project = Project.all.last

    assert project.ca_private_key
    assert project.ca_public_key
    assert_response 201
  end

  # TODO: test creation with organization

  test 'should show project' do
    get project_url(@project)
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project), params: {
      project: {
        description: @project.description, name: @project.name,
        passphrase: @project.passphrase,
        organization_id: @project.organization_id,
        key: @project.key
      }
    }

    project = Project.all.last

    assert project.ca_private_key
    assert project.ca_public_key
    assert_response 200
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_response 204
  end
end
