boardbank
=========

Connects community members with nonprofit board opportunities.


--------
Elastic Search: A Brief How-To (local)

If you want to run elastic search, from the workspace, run the following:
    elasticsearch-2.2.0/bin/elasticsearch
This command will run the search program.

Then, on a separate terminal window, from the workspace, run the following:
    rake searchkick:reindex:all
This command will reindexes the database (for all present users).This

Finally, run:
    rails s -b $IP -p $PORT
to launch the server (for C9).

We have yet to test elasticsearch on Heroku, but according to Abraham, the
searchbox addon configures the elasticsearch program; therefore, there is no
need to run the "elasticsearch-2.2.0/bin/elasticsearch" command. We will test
this more in the coming iterations/sprints.