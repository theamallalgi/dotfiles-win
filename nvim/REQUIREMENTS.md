# Neovim Configuration Requirements

This document outlines the external dependencies required for this Neovim configuration to function correctly. Most of these tools are installed automatically by `mason.nvim`, but manual installation instructions are provided for completeness and for tools not managed by Mason.

## Core Dependencies

These are essential for full functionality.

### Language Servers, Linters, and Formatters

The following tools are managed by `mason.nvim` and should be installed automatically. If you encounter issues, you can install them manually.

| Tool              | Language(s) | Installation (Windows - Scoop) | Installation (Linux - apt/dnf/pacman)                               |
| ----------------- | ----------- | ------------------------------ | ------------------------------------------------------------------- |
| `black`           | Python      | `scoop install python; pip install black` | `sudo apt install python3-pip; pip install black`                  |
| `isort`           | Python      | `pip install isort`            | `pip install isort`                                                 |
| `ruff`            | Python      | `pip install ruff`             | `pip install ruff`                                                  |
| `stylua`          | Lua         | `scoop install stylua`         | `cargo install stylua` (requires Rust)                              |
| `prettier`        | Web         | `scoop install nodejs; npm i -g prettier` | `sudo apt install node; sudo npm i -g prettier`                     |
| `eslint_d`        | Web         | `npm i -g eslint_d`            | `sudo npm i -g eslint_d`                                            |
| `shfmt`           | Shell       | `scoop install shfmt`          | `sudo apt install shfmt`                                            |
| `shellcheck`      | Shell       | `scoop install shellcheck`     | `sudo apt install shellcheck`                                       |
| `golangci-lint`   | Go          | `scoop install golangci-lint`  | `go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest` |
| `buf`             | Protobuf    | `scoop install buf`            | `go install github.com/bufbuild/buf/cmd/buf@latest`                 |

### Other Tools

- **Nerd Font**: Required for icons to display correctly. Download and install a Nerd Font like [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) and configure your terminal to use it.
- **Compiler**: A C compiler is needed for `nvim-treesitter` to build parsers.
  - **Windows**: Install the "Desktop development with C++" workload from the Visual Studio Installer.
  - **Linux**: `sudo apt install build-essential` or `sudo dnf groupinstall "Development Tools"`

## Performance and Bug Fixes

Here are some suggestions to improve the speed and stability of your configuration:

1.  **Startup Time**: You are using `lazy.nvim`, which is excellent for startup performance. To profile your startup time and identify slow plugins, you can use the built-in profiler:
    ```bash
    nvim --startuptime startup.log
    ```
    Then, inspect the `startup.log` file to see which plugins are taking the most time to load.

2.  **Redundant Formatting**: You have format-on-save configured in both `lsp.lua` and `nonels.lua`. While this isn't a major issue, it's slightly redundant. The `conform.nvim` plugin is designed to handle formatting, so you could centralize your formatting logic there and disable the format-on-save autocmd in `lsp.lua`.

3.  **Checkhealth**: Run `:checkhealth` in Neovim to see if there are any other configuration errors or missing dependencies. This is a great way to diagnose issues.

By ensuring these dependencies are met and considering these performance tips, your Neovim configuration should be faster and more portable across different machines.
