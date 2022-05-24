# Product NPM package publisher

This Action creates an NPM package from product and publishes it
to the registry using the appropriate versioning.

If the action is triggered by a `push` event on the master branch,
it creates a latest version and it publishes it to the NPM Github
registry for Lostmyname.

If the action is triggered by a pull request event on a remote branch
which is in development, it creates a prerelease version and it publishes
it to the NPM Github registry for Lostmyname.

## Inputs

### `muse_npm_auth_token`

**REQUIRED** The NPM github registry auth token.

### `github_ref`

The branch the action is running on. Used conditionally to define the package versioning.

### `github_event_action`

The event type `[open, synchronize]` that triggers the build if the event is a pull request.
Used conditionally to define the package versioning.

## Example usage

```
uses: Lostmyname/product-package-publisher
  with:
    muse_npm_auth_token: ${{ secrets.MUSE_PACKAGE_INSTALL }}
    github_ref: ${{ github.ref }}
    github_event_action: ${{ github.event.action }}
```
