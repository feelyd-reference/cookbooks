require 'minitest/spec'

describe_recipe 'directories' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it 'ensue wrietable direcotry for drupal' do
    if deploy[:application_type] = 'php'
      directory("#{deploy[:deploy_to]}/current/sites/default/files").must_exist.with(:mode, '0660').and(:owner, deploy[:user]).and(:group, deploy[:group])
    end
  end
end