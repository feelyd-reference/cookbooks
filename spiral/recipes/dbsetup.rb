node[:deploy].each do |app_name, deploy|
  script "get_db" do
    cwd "#{deploy[:deploy_to]}/current"
	gitUrl = "git@bitbucket.org:spiralsolutions/dbdump.git"
	
	code <<-EOH
		if [[ ! -d /tmp/dbdump ]]; then
			mkdir /tmp/dbdump
		fi
		git clone git@bitbucket.org:spiralsolutions/dbdump.git /tmp/dbdump
	EOH
  end
 end