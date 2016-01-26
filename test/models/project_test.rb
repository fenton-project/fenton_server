require 'test_helper'

# http://guides.rubyonrails.org/testing.htmls

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
  end

  test 'should be a project' do
    assert_equal 'Production Machines', @project.name
    assert_equal 'The production machines project', @project.description
    assert_equal 'Foobar', @project.passphrase
    assert_equal 1, @project.organization_id
    assert_equal 'productionmachines', @project.key
  end

  test 'should not save project without a name' do
    @project.name = nil
    assert_not @project.save
  end

  test 'should not save project without a description' do
    @project.description = nil
    assert_not @project.save
  end

  test 'should not save project without a passphrase' do
    @project.passphrase = nil
    assert_not @project.save
  end

  test 'should not save project without a organization_id' do
    @project.organization_id = nil
    assert_not @project.save
  end

  test 'should get private and public keys after project is created' do
    assert @project.ca_private_key
    assert @project.ca_public_key
  end

  test 'should not save project with name having a special character' do
    @project.name = "My Foobar--"
    assert_not @project.save
  end

  test 'should not save project with key having a space' do
    @project.key = "My Foobar--"
    assert_not @project.save
  end

  test 'should save project with key being all lowercase' do
    @project.key = "MyFoobar"
    assert @project.save
    assert_equal "myfoobar", @project.key
  end
end
