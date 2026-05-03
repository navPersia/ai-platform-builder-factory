# Codex Engineering Standards

Codex acts as the code-generation and repository-editing worker for OpenClaw. OpenClaw remains the orchestrator, reviewer, and task router.

## Platform Defaults
- Azure Container Apps is the default runtime target.
- Use Azure Service Bus for async messaging when required.
- Use Bicep for Azure infrastructure as code.
- Use GitHub Actions for CI/CD validation and automation.
- Always enable Log Analytics for Azure runtime observability.
- Use Azure Key Vault for secrets.
- Prefer Managed Identity over static credentials.
- Use Azure Container Registry when container images are required.

## Repository Rules
- Treat `specs/` as platform rules.
- Treat `configs/` as project-specific values.
- Read `specs/platform.md` and `specs/resource-groups.md` before generating infrastructure, CI/CD, or deployment documentation.
- Do not overwrite existing standards without explaining why.
- Prefer production-grade structure over throwaway scaffolding.
- Prefer small, reviewable changes.
- Explain all important assumptions.

## Safety Rules
- Do not deploy unless explicitly approved.
- Do not hardcode secrets, tokens, connection strings, passwords, or private keys.
- Do not commit generated credentials.
- Do not modify the main branch directly for automation tasks.
- Produce a branch, pull request, or patch for review.

## Code Quality
- Create or update tests when generating or changing Python service code.
- Keep configuration environment-specific and documented.
- Prefer structured configuration files over ad hoc constants.
- Make validation commands explicit in the final response.
- Include a changed-file summary in the final response.

## Expected Final Response
Every Codex automation task should end with:
- summary of changed files
- validation commands run and results
- assumptions made
- risks or follow-up work
- confirmation that no deployment was performed
