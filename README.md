ardour-git-cli
==============

Audiogit is a plugin for ardour to commit and push automatically to a git repository.
This project is part of the Audio-git project which aims to enable people to freely share the "source code" for audio projects.

REQUIREMENTS
------------

* Ruby 1.9.2

USAGE
-----

* audiogit --create name_of_project : create a new project
* audiogit --clone project_url  : clone an existing project
* audiogit --watch : watch session for changes
* audiogit --publish name_of_version : publish a version
* audiogit --show : show published versions

TODO
----

* First run: Create git repository if not created
* First run: ask for remote repository
* (First run: if not provided, create automatically remote repository => later?)
* Add required files according to session file (Ardour xml files + others)
* Watch for change in Ardour xml file => include session files by parsing Ardour xml file
* Publish a new version to public (=create a tag)
