# pipelines

## Instructions

Azure DevOps can be used for free provided your GitHub repos are public.

- Create an Azure DevOps multistage pipeline based on the specification below
    - save all file(s) into this folder
- State an assumptions or additional configuration required in Azure DevOps in a file called [ASSUMPTIONS.md](./ASSUMPTIONS.md)

## Pipeline specification

### Build

- build stage should contain the following steps:
    - create a file called "hello.txt" in a directory called "assets", whose contents is "hello world"
    - publish artifact
    - runs 'echo "test suite ran successfully"' to simulate a test suite being run

### Deployments

The "code" should be deployed to the following environents (in order):

- dev
- staging
- prod

each deploying environment should do the following:
- only run if the build stage was successful
- run in order i.e. dev, followed by staging, followed by prod
- contain the following step
    - display the contents of the artifact
- to simulate additional deployment tasks, create the following steps
    - runs "echo 1"
    - runs "echo 2"
    - runs "echo 3"
    - runs "echo 4"
    - runs "echo 5"

Note: "steps" is the literal definition in the Azure DevOps [YAML](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps?view=azure-pipelines). These are the individual sequence of operations (tasks). They are NOT individual lines in a script.


## Important advice

When designing your pipeline consider things like 

- code reuse, avoiding manually duplicating (copy and pasting) identical steps in other stages
- tracking which pipeline run has run in each environment
- running jobs in parallel to speed up the pipeline run

