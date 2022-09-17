FROM gitpod/workspace-full

USER gitpod

# The frontend is using elm, this is not included in workspace-full
RUN bash -cl "npm install -g elm@latest-0.19.1 elm-format"