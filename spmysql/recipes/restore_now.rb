log "command" do
	message "Running command: /usr/local/bin/s3mysqlrestore.sh #{node[:spmysql][:restore_file]}"
	level :debug
end

bash "restore_now" do
	action :run
	code "/usr/local/bin/s3mysqlrestore.sh #{node[:spmysql][:restore_file]}"
end