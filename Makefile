build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://noah.zone --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E1S78D3CODP4F6 --paths '/*'