- [**lambda-layer**](#lambda-layer)
  - [**Environments**](#environments)
  - [**Docker Image**](#docker-image)
- [**Usage**](#usage)
  - [**Required Arguments**](#required-arguments)
  - [**Optional Arguments**](#optional-arguments)

<br>

# **lambda-layer**
Easily create layers for AWS Lambda functions by using a docker container that already has the the proper environments.

The python program `lambda-layer` is used both as how the the Docker image is ran locally, and how the layers are created within the container.

**All layers that are created are installed using pip**

<br>
<br>

## **Environments**
This will create the below default python environments. Each environment will also have pip installed.

* std309 - python3.9
* std308 - python3.8

<br>

## **Docker Image**

* **personamsolis/layermaker** : [https://hub.docker.com/repository/docker/personamsolis/layermaker]

<br>

<br>

# **Usage**
This is how you actually use all of the tools that have been granted to you.



<br>

## **Required Arguments**


<br>


## **Optional Arguments**


