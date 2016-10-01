execute 'Execute my script' do 
  user    'root'
  command 'npm -g install npm'
end

execute 'Execute my script' do 
  user    'root'
  command 'sudo npm config set registry http://registry.npmjs.org/'
end

