include_recipe 'deploy'
Chef::Log.info("********** activate logrotate on shutDown'**********")
bash "shutDown" do
  user 'root'
  cwd  "/var/lib/logrotate"
  code <<-EOH
    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
  EOH
end