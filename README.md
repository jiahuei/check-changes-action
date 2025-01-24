# Check Changes Action

This GitHub Action checks if changes were made in a list of directories.

## Inputs

- `watch-dir`: Space-delimited list of directories to look for changes.

## Outputs

- `has-changes`: `1` if changes were detected in any of the directories, otherwise `0`.

## Example Usage

```yaml
jobs:
  check-changes:
    runs-on: ubuntu-latest
    outputs:
      has-changes: ${{ steps.check.outputs.has-changes }}
    steps:
      - name: Check for changes
        uses: jiahuei/check-changes-action@v0
        id: check
        with:
          watch-dir: "src/python/"

  # Only run if there are changes
  tests:
    runs-on: ubuntu-latest
    needs: check-changes
    if: needs.check-changes.outputs.has-changes
    steps:
      - name: Echo
        run: echo "Changes detected"
```
