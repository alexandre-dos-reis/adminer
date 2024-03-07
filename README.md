# Adminer

A simple adminer app using nix for development purpose.

## Start

### With nix

- Start with `./start.sh` and access the adminer app at `http://localhost:8888`.

### With devenv and https

- **WARNING**: This method will mess with `/etc/hosts`. Backup this file before continuing.
- Install the [devenv cli](https://devenv.sh/getting-started/).
- Start with `devenv up` and access the adminer app at `https://adminer.dev`.
