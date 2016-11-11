Boardbank [![Build Status](https://travis-ci.org/CSC322-Grinnell/boardbank.svg?branch=dev)](https://travis-ci.org/CSC322-Grinnell/boardbank)
=========

This repository contains the class project of Grinnell College CSC-322 Team Software Development class. 
In collaboration with Greater Poweshiek Community Foundation (GPCF), this web application connects community members with nonprofit board opportunities.

##Table of Contents
1. Boardbank from a User Perspective
..1.1 Volunteer
..1.2 Organization
..1.3 Admins
2. Boardbank from a Developer Perspective
..2.1 Overview
..2.2 Installation
..2.3 Test Suite
..2.4 Common Issues
..2.5 Implementation Details
....2.5.1 Volunteer Skills
....2.5.2 Volunteer Interests
3. Contributors
4. Liscence

#1. Boardbank from a User Perspective

Boardbank serves three types of users:
1. Volunteers - individuals who are interested in being on the boards of nonprofits. 
2. Organizations - nonprofit organizations looking for people to serve on their administrative boards.  
3. Admins - GPCF employees who manage how volunteers and organizations use the website.

##1.1 Using Boardbank as a Volunteer
Volunteers are able to create a profile and search for organizations. Once a volunteer creates an
account and profile, they can either wait for an organization to contact them or search for organizations
and reach out to organizations that interest them. We recommend that volunteers fill out the profiles
with as much information as they are comfortable doing - the more information a volunteer provides,
the easier it will be for organizations to find volunteers that fit the organization's needs.
Volunteers can include the following information about themselves:


##1.2 Using Boardbank as an Organization
Coming soon

##1.3 Using Boardbank as an Admin
Coming soon

To login as an admin, go to 
```
/admin
```
Here, you can approve organizations' profiles.

#2. Boardbank from a Developer Perspective
Coming soon

##2.1 Overview
Coming soon

##2.2 Installation

In order to clone the project to your local machine, do:
```bash
git clone https://github.com/CSC322-Grinnell/boardbank.git
```
Make sure to migrate and seed the database as well:
```bash
rake db:migrate
rake db:seed
```

##2.3 Test Suite

This project employs Cucumber tests. To run the tests, do:
```bash
rake db:migrate RAILS_ENV=test
cucumber
```
Currently, all the tests pass except for unimplemented features!

##2.4 Common Issues

This project uses Elasticsearch for the search features. If you are having errors related to Faraday, timeout, port 9200, restarting Elasticsearch usually takes care of the problem.

To install Elasticsearch for Mac users, run:
```bash
brew install elasticsearch
rake searchkick:reindex:all
```
To restart Elasticsearch on Mac, run
```bash
/usr/local/bin/elasticsearch -p --restart
```

To install Elasticsearch for Linux users (Cloud 9), run:
```bash
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo update-rc.d elasticsearch defaults 95 10
rake searchkick:reindex:all
```

To restart Elasticsearch on Linux, run:
```bash
/etc/init.d/elasticsearch restart
```

##2.5 Implementation Details
Coming Soon

####2.5.1 User Skills
Coming Soon

####2.5.2 User Interests
Comoing Soon


#3. Contributors

Fall 2016 CSC-322 Members
* Giang Nguyen '17, Ying Long '17, Zachary Segall '18, Marios Tsekisidis '17, Elizabeth Zak '18

Spring 2016 CSC-322 members:
* Mira Hall '16, Noah Schlager '16, Ashwin Sivaramakrishnan '16, David Chang '18, Sooji Son '18

#4. License

The MIT License (MIT)

Copyright (c) 2014 CSC322-Grinnell

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
