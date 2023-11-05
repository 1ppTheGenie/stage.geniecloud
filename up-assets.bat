aws s3 sync d:\Dropbox\development\genie-marketing-hub-master\GenieHub\genie-hub-cloud\public\_assets s3://genie-hub-2/_assets/ --delete --cache-control max-age=3600
aws s3 sync d:\Dropbox\development\genie-marketing-hub-master\GenieHub\genie-hub-cloud\public\_assets s3://genie-cloud/_assets/ --profile genie-hub-active --delete --cache-control max-age=3600

