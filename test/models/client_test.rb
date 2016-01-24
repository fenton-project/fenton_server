require 'test_helper'

# http://guides.rubyonrails.org/testing.htmls

class ClientTest < ActiveSupport::TestCase
  setup do
    @client = clients(:one)
  end

  test 'should be a client' do
    assert_equal 'Foo Bar', @client.name
    assert @client.public_key
  end

  test 'should not save client without a name' do
    @client.name = nil
    assert_not @client.save
  end

  test 'should not save client without a public_key' do
    @client.public_key = nil
    assert_not @client.save
  end
end
