This cookbook is dependent on [sp-s3cmd](http://gitlab/devops/aws_chef/tree/develop/sp-s3cmd) cookbook - please review the custom JSON needed for to work. http://gitlab/devops/aws_chef/tree/develop/sp-s3cmd

Install 
============


Add this custom recipe to opswors setup event so it will create the cron and script to make backups.

you must supply custom JSON for setup of AWSkey and AWSsecret so the setup file will be able to access S3 to store the backups. The keys need to be of IAM user that has access permissions .

please supply in custom JSON for the stack you create with the bucket name for runing cron jobs :


```json
{
  "spmysql": {
    "bucket": "name of bucket"
    
  }
}
```



Ad-Hoc backup 
==================

run recipe spmysql::backup_now  to preform an add hoc backup of the DB



restore
=======================
to restore the DB from backup run recipe spmysql::restore_now  with custom JSON for paramters :

```json
{
  "spmysql": {
    "bucket": "name of bucket",
    "restore_file" : "folder/filename "
  }
}
```

you can also add to custome JSON s3cmd entries to change region or accesskeys 