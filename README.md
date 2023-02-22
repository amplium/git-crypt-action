# git-crypt action - transparent file encryption for GitHub Actions

`git-crypt-action` speeds up and simplifies using [`git-crypt`](https://github.com/AGWA/git-crypt) inside your GitHub
Action workflows by downloading a pre-built docker image and unlocking your
repository. This has the benefit of being faster than having to `apt-get
install git-crypt`. It also takes care of re-locking the repository before
finishing your workflow.

To use this workflow, export your key and encode it with `base64`, then
register it as a GitHub Secret.

```bash
❯ git-crypt export-key - | base64
```

Finally, use it in your workflow.

```yaml
jobs:
  some_job:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: amplium/git-crypt-action@latest
        with:
          key: ${{ secrets.KEY }}
```
