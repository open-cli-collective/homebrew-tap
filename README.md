# Homebrew Tap for open-cli-collective

This tap contains Homebrew casks for CLI tools maintained by [open-cli-collective](https://github.com/open-cli-collective).

## Installation

```bash
brew tap open-cli-collective/tap
```

## Available Tools

| Tool | Description | Install |
|------|-------------|---------|
| [cfl](https://github.com/open-cli-collective/confluence-cli) | CLI for Atlassian Confluence | `brew install --cask cfl` |
| [gmail-ro](https://github.com/open-cli-collective/gmail-ro) | Read-only CLI for Gmail | `brew install --cask gmail-ro` |
| [newrelic-cli](https://github.com/open-cli-collective/newrelic-cli) | CLI for New Relic | `brew install --cask newrelic-cli` |
| [slack-chat-api](https://github.com/open-cli-collective/slack-chat-api) | CLI for Slack | `brew install --cask slack-chat-api` |

## Usage

After tapping, install any tool:

```bash
# Confluence CLI
brew install --cask cfl

# Gmail (read-only)
brew install --cask gmail-ro

# New Relic CLI
brew install --cask newrelic-cli

# Slack CLI
brew install --cask slack-chat-api
```

## Updating

```bash
brew update
brew upgrade --cask <tool-name>
```

## Why Casks?

These tools are distributed as casks (rather than formulas) to automatically handle macOS Gatekeeper quarantine removal for unsigned binaries.
