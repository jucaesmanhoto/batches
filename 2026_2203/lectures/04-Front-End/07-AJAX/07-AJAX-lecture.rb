#  Disclaimer about the projects! :)

################################
################################
##  AJAX & EXTERNAL PACKEGES  ##
################################
################################

### FROM YESTERDAY
#
## HTTP request - composed of 4 elements:
#
# **VERB**: GET / POST / PATCH / DELETE ([REST pattern](https:#en.wikipedia.org/wiki/Representational_state_transfer))
# **URL**: the address of the resource requested
# **HEADERS**: provide additional informations about the request
# **BODY (optional)**: used to send data to the server

## Key takeaways
#
# APIs are interfaces for programs to interact with a service
# A request is made of a VERB, a URL and HEADERS, and can have a BODY
# Requests and responses can be in different formats
# Private endpoints require a token (to pass through the headers)


################################
##            AJAX            ##
################################

# (A)synchronous (J)avascript (A)nd (X)ML

## Fetch
#
# fetch(url, { # Second argument allows to precise verb, headers and body
#     method: "POST",
#     headers: {},
#     body: ""
#   }
# )
#
# .then((response) => {
#   # Do something once HTTP response is received
# })
#
# const url = "https://api.github.com/users/dhh"
# console.log(fetch(url));
#
## What IS A PROMISE?
# => A Promise is a representation of a value that may be available in the future.
# It's a placeholder for a result that may take some time to be compute.
# => We use them to perform multiple tasks asynchronously in JavaScript.
#
# => A Promise allows you to wait for the end of task and .then perform
# some code
# => It has 3 states: pending, fulfilled and rejected
# => When the it reaches the fulfilled state, it executes the code inside the .then()
#
## What IS A RESPONSE?
# => It's an interface of the fetch API that represents the response to a HTTP request
# => You can access to the content of the Response by calling .json() (which also returns a Promise)
#
# const url = "https://api.github.com/users/dhh"
#
# console.log("passo 1");
# fetch(url) // Make the HTTP request
#   .then((response) => {
#     console.log("passo 2");
#     return response.json();
#   }) // Wait for the response and parse it as JSON
#   .then((data) => {
#     console.log("passo 2");
#     console.log(data); // Wait for parsing, allowing us to manipulate the data
#   });
# console.log("passo 3");
#
#
##############################################
##            Adding JS Packages            ##
##############################################
#
## IMPORTMAPS
#
# => A library to organise JavaScript imports
#
# How does it work?
# <script type="importmap">
# {
#   "imports": {
#     "bootstrap": "https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js",
#     "sweetalert2": "https://cdn.jsdelivr.net/npm/sweetalert2@11.7.1/+esm"
#   }
# }
# </script>
