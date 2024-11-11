# First Time Setup

This document walks you through setting up a new machine for the first time. Depending on specifics some steps may be missing, incomplete, or incorrect, in which case please update as appropriate.

1. Sign into Github and generate a new (classic) PAT, making sure to record it
2. Open `Terminal` and run the following command, substituting the appropriate values:

    ```shell
    EMAIL= \
    GH_USERNAME= \
    GH_TOKEN= \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/edobry/dotfiles/HEAD/scripts/setup.sh)"
    ```

3. Follow the instructions to configure `chitin` (run `chiConfigModify` and fill in the appropriate values)
