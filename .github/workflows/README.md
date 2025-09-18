# GIT HUB Action For Kbase Static Validation

This workflow gets triggered to do the static validation of the parameters required in a kbase. Since Kbase is a very significant element for the AI chatbot to function, it has to have the required format met.
Please find the details about this action below:

When:
  PR request or Push request to main (so no one can skip the test and do a direct commit).

Scope:
  This will run on all the yaml or yml XRD files changed in the current request
