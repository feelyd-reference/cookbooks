sp-s3cmd Cookbook
==============

This chef cookbook installs the latest s3cmd from the master branch at github.
It downloads the tarball of master: https://github.com/s3tools/s3cmd/archive/master.tar.gz

The latest version of S3CMD from github seems to work better than the older versions included in Ubuntu and CentOS.

Be aware this is an alpha version 
This is fork from :
https://github.com/fred/chef-s3cmd


Requirements
------------
  
  This cookbook will install the following packages:

  - python
  - python-setuptools
  - python-distutils-extra


Attributes
----------


e.g.
#### s3cmd::default
```
  ['s3cmd']['url']              String    Tarball URL to download s3cmd                                https://github.com/s3tools/s3cmd/archive/master.tar.gz
  ['s3cmd']['gpg_passphrase']   String    GPG passphrase used to encrypt files before uploading        some-top-secret-passphrase
  ['s3cmd']['encrypt']          Boolean   Enable Encryption of files before uploading to S3 using gpg  false
  ['s3cmd']['secret_key']       String    AWS secret key  
  ['s3cmd']['access_key']       String    AWS access key    
  ['s3cmd']['bucket_location']  String    Datacentre to create bucket in. As of now the datacenters are: US (default), EU, ap-northeast-1, ap-southeast-1, sa-east-1, us-west-1 and us-west-2
  ['s3cmd']['user']             String    User to install .s3cfg config                                ubuntu</tt></td>
  ['s3cmd']['config_dir']       String    Directory where the .s3cfg config file will be installed.  This must be explicitly set if the user account is created by chef.
```  
Usage
-----

#### s3cmd::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `s3cmd` in your node's `run_list` and configure it

```json
{
  "s3cmd": {
    "user": "ubuntu",
    "encrypt": true,
    "gpg_passphrase": "some-top-secret-passphrase",
    "secret_key": "your-secret-key",
    "access_key": "your-access-key",
    "bucket_location": "EU"
  }
}
```




