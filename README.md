# DropboxResolver

Redirects to the download link from a shortened Dropbox link.

## Usage

Send a HTTP GET request like this:

```
curl http://dropbox-resolver.herokuapp.com/?link=http%3A%2F%2Fdb.tt%2Fo6tO9Luc
```

Make sure the ``link`` parameter is URL escaped.
