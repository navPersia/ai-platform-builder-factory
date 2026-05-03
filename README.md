# AI Platform Builder Factory

This repository contains the OpenClaw + Codex automation scaffold for Azure AI agent projects.

## Architecture

- OpenClaw is the orchestrator and task router.
- Codex is the coding worker invoked with `codex exec`.
- GitHub is the source of truth for repository code.
- GitHub Actions validates changes and opens draft pull requests.
- Azure Container Apps is the default runtime target.

Codex may edit files, but it must not deploy unless explicitly approved. Automation should work on a `codex/*` branch or produce a patch for review.

## Local Commands

Run Codex from an OpenClaw bootstrap brief:

```bash
scripts/run-codex-bootstrap.sh briefs/my-project.md
```

Run Codex from an OpenClaw feature brief:

```bash
scripts/run-codex-feature.sh briefs/my-feature.md
```

Run a repository review:

```bash
scripts/run-codex-review.sh
```

Direct non-interactive example:

```bash
codex exec "Read this repository and generate the missing Bicep modules for Azure Container Apps, Log Analytics, Key Vault, ACR, and Managed Identity. Follow the standards in specs/ and configs/. Do not deploy."
```

## GitHub Actions Setup

Configure one of these repository or organization secrets for Codex authentication:

- `OPENAI_API_KEY`
- `CODEX_API_KEY`

The workflows under `.github/workflows/` are manual `workflow_dispatch` automations. They create `codex/*` branches, run Codex, commit changes, and open draft pull requests. They do not deploy.

## Production ACA Environment

The existing production Azure Container Apps managed environment is captured in `configs/azure/prod.container-apps-environment.yaml`.

Codex and OpenClaw should treat that file as project-specific configuration for West Europe production work. Sensitive values such as Log Analytics shared keys, certificate values, passwords, and application secrets must stay in Azure Key Vault or GitHub Actions secrets.

## OpenClaw Calling Pattern

OpenClaw should:

1. Collect requirements or analyze the requested task.
2. Create a structured Markdown brief.
3. Run a local script or trigger a GitHub Actions workflow.
4. Review Codex output using `.claw/prompts/codex-review.md`.
5. Accept, revise, or reject the result before any deployment workflow is considered.

## Next Steps for Azure Deployments

- Add `specs/` platform rules for Azure environments, naming, networking, security, and observability.
- Add `configs/` values for each project and environment.
- Add Bicep modules for Azure Container Apps, Log Analytics, Key Vault, ACR, and Managed Identity.
- Add validation-only workflows for Bicep build, linting, and test execution.
- Add deployment workflows later with explicit approval gates and environment protections.
