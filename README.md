Boardbank [![Build Status](https://travis-ci.org/CSC322-Grinnell/boardbank.svg?branch=dev)](https://travis-ci.org/CSC322-Grinnell/boardbank)
=========

This repository contains the class project of Grinnell College CSC-322/324 Software Development class. 
In collaboration with Greater Poweshiek Community Foundation (GPCF), this web application connects community members with nonprofit board opportunities.

## Table of Contents
1. Boardbank from a User Perspective
  1. Individual
  2. Organization
  3. Admin
2. Boardbank from a Developer Perspective
  1. Installation
  2. Test Suite
    1. Running Tests
  3. Implementation Details
  4. Common Issues
  5. Resources
    1. ElasticSearch
    2. ActiveAdmin
3. Contributors
4. Lisence

# 1. Boardbank from a User Perspective

The Boardbank website is designed to connect volunteers who are interested in 
serving on the board of a nonprofit organization with organizations who need
board members. The website serves three types of users:
1. Individuals - individuals who are interested in being on the boards of nonprofits. 
2. Organizations - nonprofit organizations looking for people to serve on their administrative boards.  
3. Admins - GPCF employees who manage how volunteers and organizations use the website.

## 1.1 Using Boardbank as a Individual
As a volunteer, the first thing you need to do is sign up and create a profile. You can do so from the front page
of the website by clicking on the green "user" button. On the sign up page, you can provide information 
about yourself, your skills, and your interests. You can provide as much or as little information as 
you like, but we'd recommend filling out the profile with as much information as you are comfortable with - 
the more information a volunteer provides, the easier it will be for organizations to find volunteers that 
fit the organization's needs. Organizations will contact you through the information you provide on the page.
You can always edit the information you provide later.

Once you have signed up, you can log in to your profile through the white "user sign in" button on the front page.
After logging in, you can search for organizations by clicking on the "organizations" tab at the top the screen
and using the search function to find organizations that might interest you. Alternatively, you can wait for
organizations to find and contact you. You can also view and edit your profile from the profile tab.

## 1.2 Using Boardbank as an Organization
As an organization representative, the first thing to do is sign up your organization and create a profile
for it. You can do so from the front page of the website by clicking on the green "organization" button. 
On the sign up page, you can provide information the organization, including its location and description.
After signing up, you will have to wait for an administrator to approve your organization before you can use
the website.

Once you have signed up and an administrator approves the organization, you can log in to the organization profile 
through the white "organization sign in" button on the front page.
After logging in, you can search for volunteers by clicking on the "volunteers" tab at the top the screen.
The search allows you to filter by skills and interests to find volunteers who meet the qualifictions necessary
for the organization board. Once you find volunteers who seem suitable for the board, you wil need to contact them
based on the information they provide in their profile. You can also view and edit your organization profile from the profile tab.

## 1.3 Using Boardbank as an Administrator (Admin)
The only way to become an admin is to have an existing admin create an admin
profile for you. Once you have been made an admin, you can log in at 

```
/admin
```

Once you sign in, you can 
* View unapproved organizations from the **Dashboard** tab
* Add or remove other admins from the **Admin Users** tab
* View, edit, and delete organizations from the **Organizations** tab
* View, edit, and delete users from the **Users** tab
The main job of an admin is to approve organizations and make sure that 
volunteers and organizations are using the website appropriately.

# 2. Boardbank from a Developer Perspective

The Boardbank website is designed to connect volunteers who are interested in 
serving on the board of a nonprofit organization with organizations who need
boardmembers. The website is built using Ruby on Rails and is hosted on 
Heroku. We manage our test suite with Cucumber. In the last semester, we 
have done all of our development on Cloud9, which means that some advice 
might not apply in other contexts. 

The framework for the website is built under the Model-View-Controller
paradigm:
* **Models**: The models are fairly straightforward. The main models are for volunteers,
organizations, administrators. There are also models for volunteer skils and interests.
It's important to note that if you add fields to models, you have to re-migrate the 
database (see Common Issues)
* **Views**: The views use a standard html.erb format. The views are the most
detailed part of the website that we have written: most of the substantive parts
of the website heavily depend on preexisting Gems. 
* **Controllers**: There are controllers for the application, front page, 
volunteer, and organization. The application and front mostly handle URL direction.
The voluneer and organization controller are the important controllers because 
they handle most of the data management and transfer user edits to the database. 

There are two main Gems that are worth mentioning that add important features 
beyond the Rails framework: ElasticSearch and ActiveAdmin. They do pretty much
exactly what they sound like. ElasticSearch provides the code for the searching
function of the website and ActiveAdmin provides the code for the admin portions
of the website. We highly recommend furture developers become familiar with 
these packages (see resources section).

## 2.1 Installation

In order to clone the project to your local machine, do:
```bash
git clone https://github.com/CSC322-Grinnell/boardbank.git
```
Make sure to migrate and seed the database as well:
```bash
rails db:reset
```
To install Elasticsearch for Mac users, run:
```bash
brew install elasticsearch
rails searchkick:reindex:all
```

For quickly starting a new copy of the project on Cloud 9, run the following 
commands:

Start new workspace with github link
https://github.com/CSC322-Grinnell/boardbank
and choose "Rails Tutorial" for the project template as this will make the workspace with 768MB of RAM
as opposed to 512MB.

Then, execute the included installation script:
```bash
c9_install.sh
```

## 2.2 Test Suite

We break up tests by type of user (Individual, organization, admin), and then
again within those categories.

Individual:
* Navigation: logging in/out, moving from page to page
* Editing: changing different fields in the profile
* Searching: making sure searches turn up correct organizations

Organization:
* Navigation: logging in/out, moving from page to page
* Editing: changing different fields in the profile
* Searching: filtering and seeing correct volunteer

Admin:
* Navigation: logging in/out, moving from page to page
* Managing Users: view, add, edit, delete
* Managing Admins: view, add, edit, delete
* Managing Organizations: view, approve, reject, add, edit, delete

Currently, all the tests pass except for unimplemented features!

Note: In cucumber tests, you can't put comments on the same line as code.

#### 2.2.1 Running Tests

This project employs Cucumber tests. To run the tests, do:
```bash
cucumber features/
```

To run individual test files, do:
```bash
cucumber features/*filename*
```
## 2.3 Implementation Detais

In order to verify that phone numbers and other fields are in the correct 
format, we used regular expressions (regexes). The code for verifying user phone
numbers is in the sign-up page (app/views/users/new.html.erb) and the edit page 
(app/views/users/edit.html.erb)

Required/not:
We thought we would also offer the user the option of omitting phone-number entry. 
This could be achieved by simply adding:
:required => false
to the phone-number field in the .erb files. We made no alterations to the 
organizations-equivalents, so a phone number is still required for organization 
registration. However, it is easy enough to avoid people seeing a phone number or 
email address if 	they opt out of the visibility. 

#### Admin-page:

Adding links to the admin dashboard:
To create links from the Admin dashboard to view unapproved organizations, we 
added the following code to (app/admin/dashboard.rb):
@organization.each do |org|
    li link_to "View #{org.name} (#{org.email})", adminorg_path(org.id)
end

Hiding the encrypted password field in single-org:
To hide the encrypted password in the admin view, in 
app/admin/organization.rb we added the conditional:
if (field!=:encrypted_password) then
    row field
end
along with the entire show function in which it is contained. 

Action items in single-org:
In order to add the options of 
1) viewing any particular organization as a user, 
2) approving any particular unapproved organization, we added “action items”:
action_item :view_as_user, only: :show do
    link_to "View As User", org_path(params[:id])
end
	and
action_item :approve, only: :show do #only in the show page!
    if !Organization.find(params[:id]).approved? then
        link_to "Approve", approve_org_path(params[:id])
    end
end
to app/admin/organization.rb. The “only: :show” tag ensures that these 
action items (buttons at the top of the page) are only displayed on pages of 
views (‘show’-pages) of particular organizations.

## 2.4 Common Issues

One of the most common issues we run into is forgetting to restart ElasticSearch.
If you are having errors related to Faraday, timeout, port 9200, restarting 
ElasticSearch usually takes care of the problem. If you just opened the project
and the website won't work properly, try reindexing and restarting ElasticSearch


To restart Elasticsearch on Mac, run
```bash
/usr/local/bin/elasticsearch -p --restart
```

To restart Elasticsearch on Linux, run:
```bash
/etc/init.d/elasticsearch restart
```

To restart and reindex ElasticSearch on Cloud9, run:
```bash
rake searchkick:reindex:all
sudo /etc/init.d/elasticsearch restart
```

If you add a field to a model, you have to migrate the change
to the database. To do so, run the following commands:
```bash
rails generate migration add_shownumber__to_users shownumber:boolean
rake db:migrate
```

## 2.5 Resources

#### 2.5.1 ElasicSearch

SearchKick: http://searchkick.org/
elasticsearch-rails: https://github.com/elastic/elasticsearch-rails

The searchkick gem handles interacting with ElasticSearch, but if you would like 
a more in-depth overview of how ElasticSearch works, here is an introductory 
webinar video: https://www.elastic.co/webinars/get-started-with-elasticsearch?baymax=rtp&elektra=downloads&iesrc=ctr

#### 2.5.2 ActiveAdmin

Documentation for customizing ActiveAdmin index pages: 
//github.com/activeadmin/activeadmin/blob/master/docs/3-index-pages/index-as-table.md

# 3. Contributors

Fall 2018 CSC-324
* Members: Mujtaba Aslam '19, Anna Blinderman '19, Marli Remash '20, Lukas Resch '19, Zachary J. Susag '19
* Alumni Mentor: Ian Young

Fall 2016 CSC-322 
* Members: Giang Nguyen '17, Ying Long '17, Zachary Segall '18, Marios Tsekisidis '17, Elizabeth Zak '18
* Mentor: Cassie Schmitz
Spring 2016 CSC-322 members:
* Mira Hall '16, Noah Schlager '16, Ashwin Sivaramakrishnan '16, David Chang '18, Sooji Son '18

# 4. License

The MIT License (MIT)

Copyright (c) 2014,2018 CSC322-Grinnell

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
