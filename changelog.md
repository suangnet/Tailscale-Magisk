# Changelog

## v1.4.4

- UPDATE REAL BINARIES: Downloaded and replaced legacy `tailscaled` payload with the actual `v1.98.8` binaries for both `arm` and `arm64` architectures. This definitely fixes the interactive stuck login issues caused by version mismatches.

## v1.4.3

- Remove pre-bundled `tailscaled` from `bin/` directory to avoid redundancy, as it's extracted dynamically during installation.

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
