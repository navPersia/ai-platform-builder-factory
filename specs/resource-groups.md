# StudioStreamX Resource Group, Naming, and Tagging Rules

## Resource Group Strategy

Every project must have these resource group roles:

- `rg-ai`: required for AI services, agents, orchestration services, and AI-specific runtime dependencies.
- `rg-network`: required for networking, private endpoints, DNS, VNet integration, and ingress/egress controls.

Projects add these resource group roles when applicable:

- `rg-data`: required when the project owns persistent data services, databases, storage accounts, indexes, or data pipelines.
- `rg-workload`: required when workload runtime resources need isolation from shared AI or platform resources.

Use one resource group per role and environment unless a documented exception is required.

## Naming Convention

General resource naming pattern:

```text
<workload>-<component>-<env>-<region>-<instance>
```

Example:

```text
studiostreamx-agent-dev-weu-001
```

Resource group naming should preserve the role explicitly:

```text
<workload>-rg-ai-<env>-<region>
<workload>-rg-network-<env>-<region>
<workload>-rg-data-<env>-<region>
<workload>-rg-workload-<env>-<region>
```

Use `weu` for West Europe unless the project config defines another region code.

## Required Tags

All Azure resources must include:

- `environment`
- `workload`
- `owner`
- `createdBy`

Optional tags:

- `costCenter`
- `costProfile`
- `platform`

## Enforcement

Codex must check `configs/` for project-specific values before generating Bicep, GitHub Actions, or deployment docs.

If an existing resource does not comply with these rules, Codex must document the gap and avoid destructive changes unless OpenClaw explicitly approves remediation.
