calabash-ios-sample-test
========================
Git repository for running ios calabash tests

####Before running tests
	bundle install

####How to run project
	sh run.sh NA @test1 - without cleaning project
	sh run.sh clean @test1 - with cleaning and building project

####Accessing user data from support/env.rb file
	puts USER_DATA[:valid][:website]

