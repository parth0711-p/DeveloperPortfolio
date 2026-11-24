# API Summary

## What is a REST API?

A REST API allows different software applications to communicate over the internet using HTTP requests. It lets clients request or send data to a server using methods such as GET, POST, PUT and DELETE.

## HTTP Status Codes

- **200 OK:** The request was successful and the server returned the requested data.
- **404 Not Found:** The requested resource could not be found on the server.

## jq Filter

The filter used to extract GitHub profile fields:

`{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}`

- `.name` extracts the GitHub profile name.
- `.public_repos` extracts the number of public repositories.
- `.followers` extracts the follower count.
- `.created_at` extracts the account creation date.

The jq command processes JSON data and allows us to select specific fields from it.
