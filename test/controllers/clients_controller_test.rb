require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test 'should route to client list' do
    assert_routing '/clients', controller: 'clients', action: 'index'
  end

  test 'should route to a client' do
    assert_routing '/clients/1', controller: 'clients',
                                 action: 'show', id: '1'
  end

  test 'should get index' do
    get clients_url
    assert_response :success
  end

  test 'should create client' do
    assert_difference('Client.count') do
      post clients_url, params: {
        client: {
          username: @client.username,
          name: @client.name,
          email: @client.email,
          public_key: @client.public_key
        }
      }
    end

    assert_response 201
  end

  test 'should show client' do
    get client_url(@client)
    assert_response :success
  end

  test 'should update client' do
    patch client_url(@client), params: {
      client: {
        username: @client.username,
        name: @client.name,
        email: @client.email,
        public_key: @client.public_key
      }
    }
    assert_response 200
  end

  test 'should destroy client' do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_response 204
  end
end
