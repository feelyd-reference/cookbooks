include_recipe "sp-s3cmd"
skipp = true
node[:opsworks][:instance][:layers].each do |layer|
  if layer == "db-master"
    skipp = false
  end
end

node[:deploy].each do |application, deploy|
  if not skipp
    template "/usr/local/bin/s3mysqlbackup.sh" do
		  source "s3mysqlbackup.sh.erb"
		  mode "0755"
	   	owner deploy[:user]
    	group deploy[:group]
    	variables(
        :mysqluser => "root",
        :mysqlpass => (node[:mysql][:server_root_password] rescue nil),
        :s3cmdbucketname => (node[:spmysql][:bucket])
      )
    end

    template "/usr/local/bin/s3mysqlrestore.sh" do
      source "s3mysqlrestore.sh.erb"
      mode "0755"
      owner deploy[:user]
      group deploy[:group]
      variables(
        :mysqlrootpass => (node[:mysql][:server_root_password] rescue nil),
        :s3cmdbucketname => (node[:spmysql][:bucket])
      )
    end

    cron "js3mysqlbackup" do
      hour "1"
      minute "10"
      day "*"
      month "*"  
      weekday "*"
      command "/usr/local/bin/s3mysqlbackup.sh >/dev/null 2>&1"
    end
  end
end