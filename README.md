ardour-git
==============

ardour-git is a plugin for ardour to commit and push automatically to a git repository.
This project is part of the Audio-git project which aims to enable people to freely share the "source code" for audio projects.

REQUIREMENTS
------------

* Ruby 1.9

INSTALLATION
------------

* gem install ardour_git

USAGE
-----

* ardour_git --init : initialize an Ardour session directory
* ardour_git --save "log message": save current ardour session and related files with a log message

Commands to be implemented:
* ardour_git --version version_name  : create a version of current session (git branch)
* ardour_git --clone project_url  : clone an existing project
* ardour_git --watch : watch session for changes
* ardour_git --publish name_of_version : publish a version
* ardour_git --show : show published versions

TODO
----

* First run: Create git repository if not created
* First run: ask for remote repository
* (First run: if not provided, create automatically remote repository => later?)
* Add required files according to session file (Ardour xml files + others)
* Watch for change in Ardour xml file => include session files by parsing Ardour xml file
* Publish a new version to public (=create a tag)
