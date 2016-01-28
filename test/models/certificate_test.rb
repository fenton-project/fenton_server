require 'test_helper'

# http://guides.rubyonrails.org/testing.htmls

class CertificateTest < ActiveSupport::TestCase
  setup do
    @certificate = certificates(:one)
  end

  test 'should be a certificate' do
    assert @certificate.client_id
    assert @certificate.project_id
  end

  test 'should not save certificate without a client_id' do
    @certificate.client_id = nil
    assert_not @certificate.save
  end

  test 'should not save certificate without a project_id' do
    @certificate.project_id = nil
    assert_not @certificate.save
  end

  test 'should get signed key after certificate is created' do
    assert @certificate.certificate
  end
end
