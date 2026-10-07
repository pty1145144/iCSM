// One-shot diagnostic for the original AUG/SG 553 scope path. No per-frame log.
static int icsmScopeAuditRemaining = 0;
static Rect_t icsmScopeCopiedRect;
CON_COMMAND(icsm_scope_audit, "Print geometry for the next active rifle scope frame")
{
    icsmScopeAuditRemaining = 1;
}
