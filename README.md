# Homebrew Tap for open-cli-collective

This tap contains Homebrew casks for CLI tools maintained by [open-cli-collective](https://github.com/open-cli-collective).

## Installation

```bash
brew tap open-cli-collective/tap
```

## Available Tools

| Tool | Binary | Description | Install |
|------|--------|-------------|---------|
| [jira-ticket-cli](https://github.com/open-cli-collective/jira-ticket-cli) | `jtk` | CLI for Jira Cloud | `brew install --cask jtk` |
| [slack-chat-api](https://github.com/open-cli-collective/slack-chat-api) | `slck` | CLI for Slack | `brew install --cask slck` |
| [confluence-cli](https://github.com/open-cli-collective/confluence-cli) | `cfl` | CLI for Atlassian Confluence | `brew install --cask cfl` |
| [newrelic-cli](https://github.com/open-cli-collective/newrelic-cli) | `nrq` | CLI for New Relic | `brew install --cask nrq` |
| [google-readonly](https://github.com/open-cli-collective/google-readonly) | `gro` | Read-only CLI for Google services | `brew install --cask gro` |
| [cpm](https://github.com/open-cli-collective/cpm) | `cpm` | Claude plugin manager | `brew install --cask cpm` |

### Legacy Names

For backwards compatibility, these aliases are also available:

| Alias | Points To |
|-------|-----------|
| `jira-ticket-cli` | `jtk` |
| `slack-chat-cli` | `slck` |
| `newrelic-cli` | `nrq` |
| `gmail-ro` | Legacy Gmail-only CLI |
| `google-readonly` | `gro` |

## Usage

After tapping, install any tool using the short name:

```bash
# Jira CLI
brew install --cask jtk

# Slack CLI
brew install --cask slck

# Confluence CLI
brew install --cask cfl

# New Relic CLI
brew install --cask nrq

# Google services CLI (Gmail, Calendar, Contacts, Drive)
brew install --cask gro

# Claude plugin manager
brew install --cask cpm
```

## Updating

```bash
brew update
brew upgrade --cask <tool-name>
```

## Why Casks?

These tools are distributed as casks (rather than formulas) to automatically handle macOS Gatekeeper quarantine removal for unsigned binaries.
