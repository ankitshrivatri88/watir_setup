# e2e_google_login

a. Clone the repo and Install rvm- (https://rvm.io/rvm/install)
1. First install gnupg using :brew install gnupg
2. Install mpapis public key from :gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

b. install bundler 
1. type in project root folder:  gem install bundler
2. bundle install

c. specifying version of ruby
1. On project root type: rvm use (your_ruby_version)@(project_name)

d. Download Selenium Standalone Server from- (https://www.seleniumhq.org/download)
1. Extract and Start selenium server on different tab
2. Run on extracted folder : java -jar selenium-server-standalone-(version_number).jar

Now your Selenium server and rvm are installed. Switch to project folder for running the tests.

e. To run 

1) Only one Scenario: cucumber --tags @Create_offer BROWSER=chrome
2) All tests on local: cucumber WHERE=local

3) On remote:

    a) docker build --rm -t e2e-offer-test:latest .
    
    b) docker-compose up

Create seperate branch and start adding scenarios.

Happy Scripting :)

## Makefile

```
$ make help
$ make docker.build
$ make compose.run

or simply ...

$ make compose.build-and-run

```

