# Check Changes Action

This GitHub Action checks if changes were made in a list of directories.

## Inputs

- `watch-dirs`: Space-delimited list of directories to look for changes.

## Outputs

- `has-changes`: `'true'` if changes were detected in any of the directories, otherwise `'false'`.

## Example Usage

```yaml
jobs:
  check-changes:
    name: Check for changes
    runs-on: ubuntu-latest
    outputs:
      has-changes: ${{ steps.check.outputs.has-changes }}
    steps:
      - name: Check
        uses: jiahuei/check-changes-action@v0
        id: check
        with:
          watch-dirs: "src/python/ docker/ .github/"

  # Only run if there are changes
  tests:
    runs-on: ubuntu-latest
    needs: check-changes
    if: ( needs.check-changes.outputs.has-changes == 'true' || github.event_name == 'push' )
    steps:
      - name: Echo
        run: echo "Changes detected"
```
