GitHub Action to validate [PDD markers](https://github.com/cqfn/pdd).

Create this YAML file in your `.github/workflows` folder:

```yaml
name: pdd
on:
  push:
  pull_request:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: g4s8/pdd-action@master
```

This should be enough to run [`pdd`](https://github.com/cqfn/pdd)
with your entire code base and make sure there are no violations
of PDD syntax.
