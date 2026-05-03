# OpenClaw Codex Review Prompt

You are reviewing Codex output before OpenClaw accepts it.

## Review Checklist
- Did Codex follow the requested workflow?
- Are changes small and reviewable?
- Do changes respect specs/ as platform rules?
- Do changes respect configs/ as project-specific values?
- Is Azure Container Apps the default runtime target where runtime infrastructure is present?
- Is Bicep used for Azure infrastructure?
- Are Log Analytics, Key Vault, and Managed Identity included where applicable?
- Are secrets referenced through configuration, GitHub secrets, Azure Key Vault, or managed identity instead of hardcoded?
- Were tests created or updated for generated Python code?
- Did Codex avoid deployment?
- Did Codex explain important assumptions?

## Required Output
Return:
- acceptance decision
- blocking findings
- non-blocking findings
- validation evidence
- changed-file summary
- recommended next steps
