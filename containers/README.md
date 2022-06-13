# Container

## Instructions

We would like to package this API as a container for use in App Services (Web Containers / Linux)

An example Dockerfile has been provided to get you started

Provide a final Dockerfile that meets the specification

Note: you will need .NET 6.0 SDK to run the API locally

The test API end point URL /weatherforecast, HTTP method is GET.

## Specifications

- Can you make the image size smaller (current image size is 776 MB)?
    - Do we really need the full SDK for a run time image?
    - What alternate image tags (from the official Microsoft .NET docker images) could we use to reduce the footprint further
- See if you can add [SSH](https://docs.microsoft.com/en-us/azure/app-service/configure-linux-open-ssh-session) support to aid troubleshooting
- Complete the usage instructions to test the image locally (edit [USAGE.md](./USAGE.md). Assume they are using Docker for Desktop or Docker CE)
