# Check Changes Action

This GitHub Action checks if changes were made in a specific directory.

## Inputs

- `watch-dir`: The directory to watch for changes. Defaults to `src/emu/`.

## Outputs

- `has-changes`: `true` if changes were detected in the specified directory, otherwise `false`.

## Example Usage

```yaml
jobs:
  check_changes:
    runs-on: ubuntu-latest
    steps:
      - name: Check for changes
        uses: jiahuei/check-changes-action@v1
        with:
          watch-dir: "src/python/"

  tests:
    runs-on: ubuntu-latest
    needs: check_changes
    if: needs.check_changes.outputs.has-changes == 'true' # Only run if there are changes
    steps:
      - name: Echo
        run: echo "Changes detected"
```
