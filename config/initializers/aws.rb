require "aws/s3"
AMAZON_ACCESS_KEY_ID=ENV['AMAZON_ACCESS_KEY_ID']
AMAZON_SECRET_ACCESS_KEY=ENV['AMAZON_SECRET_ACCESS_KEY']
AMAZON_BUCKET=ENV['AMAZON_BUCKET']


con = AWS::S3::Base.establish_connection!(
  :access_key_id => AMAZON_ACCESS_KEY_ID,
  :secret_access_key => AMAZON_SECRET_ACCESS_KEY
)
aws_bucket = AMAZON_BUCKET