boardbank
=========

This repository contains the class project of Grinnell College CSC-322 Team Software Development class. In collaboration with Greater Poweshiek Community Foundation, this web application connects community members with nonprofit board opportunities.

## Installation

In order to clone the project to your local machine, do:
```bash
git clone https://github.com/CSC322-Grinnell/boardbank.git
```
Make sure to migrate and seed the database as well:
```bash
rake db:migrate
rake db:seed
```

## Tests

This project employs Cucumber tests. To run the tests, do:
```bash
rake db:migrate RAILS_ENV=test
cucumber
```
Currently, all the tests pass except for unimplemented features!

## Particularities

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

For Linux users (Cloud 9), run:
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

## Contributors

Spring 2016 CSC-322 members: Mira Hall '16, Noah Schlager '16, Ashwin Sivaramakrishnan '16, David Chang '18, Sooji Son '18

## License

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
