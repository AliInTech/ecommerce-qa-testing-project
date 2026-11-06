# Regression Testing Checklist — ShopEase E-Commerce Website

**Purpose:** Run this checklist after *any* code change/release to quickly verify that core,
high-risk flows still work, without re-executing all 59 test cases every time.

**How to use:** Tick each box after manually verifying it. If anything fails, log it as a bug
(`bug_reports/bug_reports.xlsx`) and re-run this checklist after the fix.

## Priority 1 — Smoke / Critical Path (run first, every release)
- [ ] User can register a new account
- [ ] User can log in with valid credentials
- [ ] User can search for a product and see results
- [ ] User can add a product to the cart
- [ ] User can proceed through checkout to payment
- [ ] A valid order can be placed successfully (card and COD)
- [ ] Order confirmation page shows a valid Order ID
- [ ] Order appears correctly in Order History

## Priority 2 — Core Functional Regression
- [ ] Cart quantity update recalculates totals correctly
- [ ] Removing a cart item updates totals correctly
- [ ] Out-of-stock products cannot be added to cart (detail page AND listing page)
- [ ] Valid coupon code applies correct discount
- [ ] Invalid/expired coupon code is rejected
- [ ] Shipping method change updates shipping cost correctly
- [ ] Invalid/declined payment is handled gracefully (no false "success")
- [ ] Wishlist add/remove works and syncs with header count
- [ ] Order cancellation works only for cancellable statuses
- [ ] Invoice download works for completed orders (card AND COD)
- [ ] Profile edit and password change work correctly
- [ ] Admin add/edit/delete product reflects correctly on storefront
- [ ] Admin stock changes reflect on both product detail AND listing pages

## Priority 3 — Secondary / Lower-risk Checks
- [ ] Review submission and star rating work; average recalculates
- [ ] Sorting and filtering on product listing pages work
- [ ] Responsive layout holds on mobile viewport for Home, Cart, Checkout
- [ ] Core flows work consistently across Chrome, Firefox, Edge
- [ ] Session expires after the defined inactivity period
- [ ] Generic/edge-case form validations (blank fields, bad formats) still show correct errors

## Priority 4 — API & Data Layer (if backend changed)
- [ ] GET /products returns 200 with correct schema
- [ ] POST /auth/login returns a token for valid credentials
- [ ] POST /auth/login returns 401 for invalid credentials
- [ ] GET /products/{invalid-id} returns 404/400 (not 500)
- [ ] SQL validation queries in `sql/db_validation_queries.sql` return expected row counts/values

---

### Regression Entry/Exit Notes
- **When to run the full checklist:** before any release/demo, or after fixing a Priority-1/2 bug.
- **When a partial run is acceptable:** a change scoped to a single module (e.g., only the
  Reviews module changed) → run Priority 1 (always) + the directly affected module's items
  from Priority 2/3.
- **Record results** by copying this checklist into a dated section below each time you run it.

### Execution Log (fill in as you actually run this)
| Date | Run By | Items Checked | Pass | Fail | Notes |
|------|--------|---------------|------|------|-------|
| _(fill in)_ | _(fill in)_ | _(e.g., P1 + P2)_ | _(count)_ | _(count)_ | _(any new bugs found)_ |
