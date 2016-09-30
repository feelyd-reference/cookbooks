#
# Cookbook Name:: sp-s3cmd
# Recipe:: default
#
# 
#


# Url to download the tarball from latest master branch from github.
default['s3cmd']['url'] = 'https://github.com/s3tools/s3cmd/archive/master.tar.gz'
default['s3cmd']['gpg_passphrase'] = 'abcdefgabad322f25fabcdefgabcdefg'
default['s3cmd']['secret_key'] = 'aaaaaaaaaaaaaaaaaaaa'
default['s3cmd']['access_key'] = 'AAAAAAAAAAAAAAAAAAAA'
default['s3cmd']['bucket_location'] = 'EU'
default['s3cmd']['encrypt'] = false
default['s3cmd']['https'] = false
default['s3cmd']['user'] = 'ubuntu'
