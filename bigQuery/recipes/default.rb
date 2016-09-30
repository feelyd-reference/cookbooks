include_recipe 'deploy'
Chef::Log.info("**********The shutDown path is : '/srv/www/#{node[:opsworks][:applications][0][:slug_name]}/current/'**********")
bash "shutDown" do
  user 'root'
  cwd  "/srv/www/#{node[:opsworks][:applications][0][:slug_name]}/current/"
  code <<-EOH
    source ../shared/app.env ; node shutDown.js 
  EOH
end