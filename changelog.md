# Changelog

## v1.4.2

- Remove duplicate legacy CLI binary (reduce zip size ~29MB).
- Use symlinked `tailscaled` for CLI commands for compatibility.
- Fix update checking issue for Magisk OTA.

## v1.4.1

- Fix tailscale up hanging in interactive terminal.
- Add TS_DEBUG_FIREWALL_MODE=nop globally on daemon runtime.

## v1.4.0

- Fixed tailscale binary permission.
- Updated Tailscale daemon and binaries to v1.98.8.
- Updated module versioning.
- Bug fixes and performance improvements.
