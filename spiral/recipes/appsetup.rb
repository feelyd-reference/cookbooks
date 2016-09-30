node[:deploy].each do |app_name, deploy|
  script "install_info" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
	
	deploy.each do |nnn|
		str+="#{nnn}"
	end

    code <<-EOH
	if [[ ! -f "info.txt" ]]; then
		strCommit=$(git log -1 --pretty=%H)
		echo "Creating info.txt ..."
		echo -e "Git commit: $strCommit" > info.txt
		echo "info.txt created"
	else
		echo "info.txt already present"
	fi
    EOH
  end
  
  template "#{deploy[:deploy_to]}/current/db-connect.php" do
	source "db-connect.php.erb"
	mode 0660
	group deploy[:group]
	
	if platform?("ubuntu")
		owner "www-data"
	elsif platform?("amazon")
		owner "apache"
	end
	
	variables (
		:host	=> (deploy[:database][:host] rescue nil),
		:user	=> (deploy[:database][:user] rescue nil),
		:password	=> (deploy[:database][:password] rescue nil),
		:db	=> (deploy[:database][:database] rescue nil),
		:dumpfile	=> (deploy[:database][:dumpfile] rescue nil))
  end
 end