require 'test_helper'

# http://guides.rubyonrails.org/testing.htmls

class OrganizationTest < ActiveSupport::TestCase
  setup do
    @organization = organizations(:one)
  end

  test 'should be a organization' do
    assert_equal 'My Foobar', @organization.name
    assert_equal 'my_foobar', @organization.key
    assert_equal [1], @organization.project_ids
  end

  test 'should not save organization without a name' do
    @organization.name = nil
    assert_not @organization.save
  end

  test 'should not save organization without a key' do
    @organization.key = nil
    assert_not @organization.save
  end
end
