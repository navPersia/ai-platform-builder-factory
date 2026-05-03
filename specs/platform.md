# StudioStreamX Platform Specification

## Purpose

These standards apply to all StudioStreamX AI platform projects. They exist to enable rapid creation of AI-driven services while enforcing production-grade Azure architecture, standardized infrastructure, CI/CD, observability, and scalable multi-agent design.

## Core Principles

### Azure-Native First

Use Azure-native services where possible:

- Azure Container Apps for runtime.
- Azure Service Bus for async messaging when needed.
- Azure Key Vault for secrets.
- Azure Log Analytics for logging and diagnostics.
- Azure Container Registry for container images.

### Configuration-Driven Architecture

- All deployments must be driven by config files.
- Do not put environment-specific logic in application code.
- `specs/` defines platform rules.
- `configs/` defines project and environment values.

### Secure By Default

- Prefer Managed Identity over secrets.
- Use private endpoints where applicable.
- Do not expose public network access unless explicitly required by the workload.
- Do not hardcode secrets, tokens, connection strings, passwords, private keys, or certificate values.

### Modular Design

- Services must be independently deployable.
- Agents must have clear contracts.
- Avoid tight coupling between agents, services, infrastructure modules, and deployment workflows.

### Production-First Mindset

- Do not create demo-only architecture.
- All generated services must be deployable to production.
- Logging, monitoring, CI/CD, and validation are mandatory.

## Platform Components

| Component | Purpose |
| --- | --- |
| Agent Service | AI logic and orchestration |
| Container App | Runtime environment |
| Service Bus | Optional async communication |
| Key Vault | Secret management |
| Log Analytics | Logging and diagnostics |
| Container Registry | Container image storage |
| GitHub Actions | CI/CD validation and automation |

## Environments

Projects must support:

- `dev`
- `prod`

Projects may also support:

- `test`

Each environment must be isolated, have its own config, and follow the platform naming and tagging rules.

## Non-Negotiables

- No hardcoded secrets.
- No manual deployments.
- No missing logs.
- No missing CI/CD.
- No direct production changes.
- No direct main-branch changes from automation.
