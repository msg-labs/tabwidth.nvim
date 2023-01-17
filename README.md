# tabwidth.nvim

Attempts to sync the `tabwidth` option based on some project settings

## Important note

For now it just works with the default packer installation path. See
the TODO section for more info.

## Installing

### With packer

```lua
use({ 'msg-labs/tabwidth.nvim', run = 'npm i' })
```

## TODO

-   [ ] Do not rely on absolute paths to run the node script to find the current
        prettier configuration.
    -   [ ] Would be great to find a way to get the absolute path of the file
    -   [ ] Other option is to copy the script to a location available in the path
-   [ ] Check for .editorconfig
-   [ ] Other languages
