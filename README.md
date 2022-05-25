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

### `user_email`

**REQUIRED** The GitHub user email associated with the NPM auth token

### `user_name`

**REQUIRED** The GitHub user name associated with the NPM auth token

### `github_ref`

The branch the action is running on. Used conditionally to define the package versioning.

### `github_event_action`

The event type `[open, synchronize]` that triggers the build if the event is a pull request.
Used conditionally to define the package versioning.

## Env

### `MUSE_NPM_AUTH_TOKEN`

**REQUIRED** The NPM github registry auth token.

## Example usage

```
- uses: Lostmyname/product-package-publisher
  env:
    MUSE_NPM_AUTH_TOKEN: 'my-npm-auth-token'
  with:
    user_email: 'user@example.com'
    user_name: 'user-name'
    github_ref: ${{ github.ref }}
    github_event_action: ${{ github.event.action }}
```
