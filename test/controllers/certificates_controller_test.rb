require 'test_helper'

class CertificatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certificate = certificates(:one)
  end

  test 'should route to certificate list' do
    assert_routing '/certificates', controller: 'certificates', action: 'index'
  end

  test 'should route to a certificate' do
    assert_routing '/certificates/1', controller: 'certificates',
                                      action: 'show', id: '1'
  end

  test 'should get index' do
    get certificates_url
    assert_response :success
  end

  test 'should create certificate' do
    assert_difference('Certificate.count') do
      post certificates_url, params: {
        certificate: {
          certificate: @certificate.certificate,
          client_id: @certificate.client_id,
          project_id: @certificate.project_id
        }
      }
    end

    assert_response 201
  end

  test 'should show certificate' do
    get certificate_url(@certificate)
    assert_response :success
  end

  test 'should update certificate' do
    patch certificate_url(@certificate), params: {
      certificate: {
        certificate: @certificate.certificate,
        client_id: @certificate.client_id,
        project_id: @certificate.project_id
      }
    }
    assert_response 200
  end

  test 'should destroy certificate' do
    assert_difference('Certificate.count', -1) do
      delete certificate_url(@certificate)
    end

    assert_response 204
  end
end
