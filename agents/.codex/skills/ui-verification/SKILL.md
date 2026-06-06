---
name: ui-verification
description: Verify frontend/UI work by inspecting the built result in a browser-capable tool.
metadata:
  short-description: Verify UI work visually
---

# UI Verification

Use after frontend/UI changes, or when asked to inspect what was built.

## Skill Order
- First use Peekaboo skill if available.
- If Peekaboo is unavailable, use Computer Use skill.
- If Computer Use is unavailable, use Browser skill.
- If none are available, skip verification and report that Peekaboo, Computer Use, and Browser skills were unavailable.

## What To Check
- Open the changed UI route/page/component.
- Capture full-page or focused screenshots as useful.
- Click controls, type input, navigate, or change state when the touched UI depends on interaction.
- Check loading, empty, error, hover/focus, mobile/desktop states when relevant.
- Verify no obvious overlap, clipping, blank canvas, broken asset, or stale state.

## Report
- Say which tool was used.
- Mention key screens/interactions verified.
- If verification was skipped, say why and do not claim visual QA passed.
