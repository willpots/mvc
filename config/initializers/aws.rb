require "aws/s3"
AMAZON_ACCESS_KEY_ID="AKIAIBZPGM6MAV67MKKA"
AMAZON_SECRET_ACCESS_KEY="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"
AMAZON_BUCKET="middvc"


con = AWS::S3::Base.establish_connection!(
  :access_key_id => AMAZON_ACCESS_KEY_ID,
  :secret_access_key => AMAZON_SECRET_ACCESS_KEY
)
aws_bucket = AMAZON_BUCKET