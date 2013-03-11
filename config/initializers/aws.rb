require "aws/s3"
AMAZON_BUCKET=ENV['AMAZON_BUCKET']


con = AWS::S3::Base.establish_connection!(
  :access_key_id => ENV['AMAZON_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
)
aws_bucket = AMAZON_BUCKET