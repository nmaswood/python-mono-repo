# python-mono-repo Proposal

# Overview

We have a couple python packages (and very likely many more to come). How can we organize them in a way that promotes:

* portablilty / reusability of modules
* ease of integration into Airflow

This README proposes changes to our current directory structure in `airflow_resources`. The primary change involves moving all of code into a `namespace_packages` based mono-repo. If we choose not to use the `namespace_packages` approach I think we should still have a conversation about how we manage our repo.
 
# Current Pain Points

## Portability

__Sharing functionality between packages is currently not very easy.__ You need to build a wheel and place that wheel into all modules where you would like that to use that module.

* Rebuilding the wheel takes times
* Putting the wheel in all down stream children takes time
* Making sure wheels are up to date takes time

## Using Airflow is Hard (Related more to having modules inside `dags` folder)

__Currently, setting up and using Airflow requires installing alot of dependencies.__ 

You need to need to have a particular set of packages installed in your site packages. 

* All of our module source code as well as our DAGS are in the `dags` folder. This means that the user executing airflow locally needs to have all the right packages for ALL the module code as well as the dag code on the computer running the airflow webserver. e.g. I need to have tensorflow installed for the `entity_tagging` installed in the same python env in which I have `airflow` installed.

__TLDR__

We should seperate modules/business logic into seperately maintained modules away from our dags.

# Proposal 

`PEP420` released implicit namespacing which is: __Namespace packages are a mechanism for splitting a single Python package across multiple directories on disk. __

Which means that we can have multiple semi-independent modules that share the same name space. Each module can be install seperately along with the co-modules it dependents on but they all exist under a common namespace and importing code from one to another is easy.

# Benefits

* Easy import of code from one module to another without dealing with the hassle of wheels, external pypi servers or otherwise. Modules that share a common umbrella of functionality can live in the same namespace.

# Cons
* Adds complexity in structure of repos
* Loose coupling of modules
* Complicates pypi distribution

# Alternatives
* Use wheels
* Private pypi server
* requirements.txt points at our git repos

