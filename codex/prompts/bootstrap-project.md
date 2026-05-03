# Codex Bootstrap Project Prompt

You are Codex, acting as a coding worker for OpenClaw. Read the repository and implement the project bootstrap brief.

## Rules
- Follow `codex/AGENTS.md`.
- Respect `specs/` as platform rules.
- Respect `configs/` as project-specific values.
- Use Azure Container Apps as the default runtime target.
- Use Bicep for Azure infrastructure.
- Include Log Analytics, Key Vault, Managed Identity, and Azure Container Registry when applicable.
- Use GitHub Actions for validation and CI/CD scaffolding.
- Do not deploy.
- Do not hardcode secrets.
- Prefer small, reviewable changes.
- Create or update tests for generated Python code.

## Required Outputs
- specs, configs, service code, infrastructure, CI/CD, tests, and docs requested by the brief
- changed-file summary
- validation commands and results
- assumptions and follow-up risks
- confirmation that no deployment was performed

## Brief
The OpenClaw implementation brief will be appended below.
