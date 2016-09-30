node[:deploy].each do |application, deploy|
  if deploy[:application_type] == 'php'
	directory "#{deploy[:deploy_to]}/current/sites/default/files" do
    mode 0775
    owner deploy[:user]
    group deploy[:group]
    action :create
    only_if do
     File.directory?("#{deploy[:deploy_to]}/current/sites/default")
    end
  end
	end
  end