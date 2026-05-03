# Project Configs

`configs/` contains project-specific values that Codex and OpenClaw should read before generating code, infrastructure, or CI/CD.

These files are not secrets stores. Do not commit passwords, tokens, connection strings, certificate values, private keys, or Log Analytics shared keys. Use Azure Key Vault, Managed Identity, and GitHub Actions secrets for sensitive values.

## Current Environments

- `azure/prod.container-apps-environment.yaml`: existing production Azure Container Apps managed environment in West Europe.
