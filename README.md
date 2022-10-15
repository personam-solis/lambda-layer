- [**lambda-layer**](#lambda-layer)
  - [**Environments**](#environments)
  - [**Docker Image**](#docker-image)
- [**Usage**](#usage)
  - [**Required Arguments**](#required-arguments)
  - [**Optional Arguments**](#optional-arguments)
    - [**Program Debug Tests**](#program-debug-tests)

<br>

# **lambda-layer**
Easily create layers for AWS Lambda functions by using a docker container that already has the the proper environments. lambda layers are how AWS lambda functions can use python packages that are not default.

The python program `lambda-layer` is used to both start the Docker container and then to create the lambda-layer
* When the script is running it just adds the `-c` switch to run the other part of the program *inside* the container.

**All layers that are created are installed using pip**

<br>

<br>

## **Environments**
This will create the below default python environments. Each environment will also have pip installed.

* std309 - python3.9
* std308 - python3.8

<br>

## **Docker Image**

* **personamsolis/layermaker** : https://hub.docker.com/repository/docker/personamsolis/layermaker

<br>

<br>

# **Usage**
This is how you actually use all of the tools that have been granted to you.

All you need to do is run the `lambda-layer` program while ensuring the below standard packages are installed:
* `logging`
* `subprocess`
* `argparse`
* `os`
* `re`
* `zipfile`
* `datetime`

<br>

## **Required Arguments**
After `lambda-layer`:

* `-p/--python`: What version of python to build layers (3.8 or 3.9)
* `-i/--install`: What python package(s) to install.
* `-n/--name`: Name of the Zipfile.

<br>


## **Optional Arguments**
* `-v`: Switch to turn on verbosity
* `-o`: Path to output directory, defaults to current dir


### **Program Debug Tests**
`lambda-layer -v -n tweepy -p 3.8 -i tweepy`
