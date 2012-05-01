ardour-git-cli
==============

ardour-git is a plugin for ardour to commit and push automatically to a git repository.
This project is part of the Audio-git project which aims to enable people to freely share the "source code" for audio projects.

REQUIREMENTS
------------

* Ruby 1.9

USAGE
-----

* ardour-git --create name_of_project : create a new project
* ardour-git --clone project_url  : clone an existing project
* ardour-git --watch : watch session for changes
* ardour-git --publish name_of_version : publish a version
* ardour-git --show : show published versions

TODO
----

* First run: Create git repository if not created
* First run: ask for remote repository
* (First run: if not provided, create automatically remote repository => later?)
* Add required files according to session file (Ardour xml files + others)
* Watch for change in Ardour xml file => include session files by parsing Ardour xml file
* Publish a new version to public (=create a tag)
