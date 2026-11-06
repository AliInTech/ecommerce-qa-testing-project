# Test Execution Report — ShopEase E-Commerce Website

> **⚠️ SAMPLE DATA DISCLAIMER:** The numbers in this report are **illustrative sample data**
> showing the correct *format and structure* of a QA execution report — they do not represent
> an actually-executed test cycle. Replace every number below with your real counts once you
> execute test cases yourself, per `docs/03_test_plan.md`, Section 12.

**Report Date:** _(fill in your execution date)_
**Build/Version Tested:** OpenCart Demo Store — build as of test date
**Prepared By:** Laraib Ali
**Test Cycle:** Cycle 1 (Sample)

---

## 1. Execution Summary (Sample)

| Metric | Count |
|---|---|
| Total Test Cases Planned | 59 |
| Test Cases Executed (sample subset) | 20 |
| Passed | 15 |
| Failed | 4 |
| Blocked | 1 |
| Not Executed | 39 |
| **Pass Rate (of executed)** | **75%** |

## 2. Module-wise Execution Status (Sample)

| Module | Planned | Executed | Passed | Failed | Blocked | Not Executed |
|---|---|---|---|---|---|---|
| Registration | 5 | 5 | 4 | 1 | 0 | 0 |
| Login | 6 | 6 | 5 | 1 | 0 | 0 |
| Product Catalog | 7 | 4 | 4 | 0 | 0 | 3 |
| Shopping Cart | 6 | 5 | 3 | 2 | 0 | 1 |
| Wishlist | 3 | 0 | 0 | 0 | 0 | 3 |
| Coupons | 3 | 3 | 2 | 1 | 0 | 0 |
| Checkout | 7 | 0 | 0 | 0 | 0 | 7 |
| Order Management | 4 | 0 | 0 | 0 | 0 | 4 |
| Profile Management | 4 | 0 | 0 | 0 | 0 | 4 |
| Admin - Product Mgmt | 4 | 0 | 0 | 0 | 0 | 4 |
| Reviews & Ratings | 3 | 0 | 0 | 0 | 0 | 3 |
| Non-Functional | 3 | 0 | 0 | 0 | 0 | 3 |
| API | 4 | 0 | 0 | 0 | 0 | 4 |
| **Total** | **59** | **20** | **15** | **4** | **1** | **39** |

*(Sample numbers only — see disclaimer above.)*

## 3. Defect Summary (linked to `bug_reports/bug_reports.xlsx`)

| Severity | Count (sample) |
|---|---|
| Critical | 1 |
| High | 3 |
| Medium | 7 |
| Low | 5 |
| **Total** | **16** |

## 4. Key Observations (Sample — illustrative of what a real report should capture)

- Checkout/Payment module carries the highest risk: the one **Critical** defect found
  (BUG-007 — decline-test card falsely shows "Order Successful") must block release sign-off
  until fixed and re-verified.
- Coupon validation (BUG-001) and out-of-stock enforcement (BUG-004) are both **High** severity
  and directly affect revenue-impacting flows — recommended fix priority: immediately after
  Critical.
- Several **Low**-severity UI/sync issues (badge counts, caching delays) do not block release
  but should be tracked for the next sprint.

## 5. Recommendation (Sample)

Based on the sample execution above, **release is NOT recommended** until BUG-007 (Critical)
and the High-severity cart/coupon defects are fixed and retested. This is the kind of
go/no-go recommendation a QA engineer is expected to make and justify — practice writing your
own once you have real execution data.

## 6. Sign-off

| Role | Name | Status |
|---|---|---|
| QA Engineer | Laraib Ali | Sample report — pending real execution |
| Test Lead / Reviewer | _(fill in if applicable)_ | — |
