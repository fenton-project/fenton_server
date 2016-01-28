require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test 'should route to organization list' do
    assert_routing '/organizations', controller: 'organizations', action: 'index'
  end

  test 'should route to a organization' do
    assert_routing '/organizations/1', controller: 'organizations',
                                       action: 'show', id: '1'
  end

  test 'should get index' do
    get organizations_url
    assert_response :success
  end

  test 'should create organization' do
    assert_difference('Organization.count') do
      post organizations_url, params: {
        organization: {
          name: @organization.name,
          key: @organization.key
        }
      }
    end

    assert_response 201
  end

  test 'should show organization' do
    get organization_url(@organization)
    assert_response :success
  end

  test 'should update organization' do
    patch organization_url(@organization), params: {
      organization: {
        name: @organization.name,
        key: @organization.key
      }
    }
    assert_response 200
  end

  test 'should destroy organization' do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization)
    end

    assert_response 204
  end
end
