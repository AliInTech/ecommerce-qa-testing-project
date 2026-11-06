# Project Overview — ShopEase E-Commerce Manual Testing Project

## 1. Why this project exists

This is a **portfolio project built for learning and demonstration purposes**. There is no real
production application behind it — instead, it uses a well-known **public demo e-commerce site**
so the test cases, bugs, and results below can actually be reproduced by anyone reviewing this
repository.

**Application Under Test (AUT):** [OpenCart Demo Store](https://demo.opencart.com) — a free,
publicly available open-source e-commerce demo store commonly used by QA learners for practice.
(You can swap in `https://www.saucedemo.com` or your own test site — the documentation structure
stays identical. This matters for an interview: be ready to say *"I tested against the OpenCart
public demo"* rather than implying a company's live production system.)

> **Honesty note for interviews:** Every deliverable in this repository is clearly labeled as
> either (a) **planning/design artifacts** you authored (SRS, Test Plan, Test Scenarios, Test
> Cases, RTM, Checklists), or (b) **sample/illustrative execution data** (Bug Reports, Execution
> Report) that show the *format and reasoning* a QA engineer uses — not a claim that a real
> project team ran this. Say exactly that if asked. Fabricating a client name or employer is
> what gets portfolio projects rejected; a clearly-labeled self-driven practice project is
> respected.

## 2. Application Requirements (what ShopEase / the demo store is assumed to do)

A typical mid-size e-commerce website has these core modules — this is the **scope** our testing
project documents and tests against:

| # | Module | Core Functionality |
|---|--------|---------------------|
| 1 | User Registration & Login | Sign up, email verification, login, logout, forgot/reset password |
| 2 | Product Catalog | Browse categories, search, filter, sort, product detail page |
| 3 | Shopping Cart | Add/remove/update items, quantity changes, cart persistence |
| 4 | Wishlist | Add/remove products to a saved list |
| 5 | Checkout | Shipping address, shipping method, payment method, order review |
| 6 | Payment | Card payment, COD, payment failure/decline handling |
| 7 | Order Management | Order history, order status, order cancellation, invoice download |
| 8 | Coupons / Discounts | Apply/remove coupon codes, validity, expiry |
| 9 | User Profile | Edit profile, manage addresses, change password |
| 10 | Admin — Product Management | Add/edit/delete product, stock management |
| 11 | Search | Keyword search, autosuggest, no-results handling |
| 12 | Reviews & Ratings | Submit review, star rating, view reviews |

## 3. Project Goal

To demonstrate, as a QA fresher, the **full manual testing lifecycle**:
Requirements → Test Planning → Test Design → Test Execution (sample) → Defect Reporting →
Traceability → Regression → API Testing → DB Validation → Reporting.

## 4. Repository Structure

```
ecommerce-qa-project/
│
├── README.md                              # Project summary & how to use this repo
│
├── docs/
│   ├── 01_project_overview.md             # This file
│   ├── 02_SRS.md                          # Software Requirement Specification
│   ├── 03_test_plan.md                    # Test Plan (IEEE 829 style)
│   └── 04_test_scenarios.md               # High-level test scenarios (module-wise)
│
├── test_cases/
│   └── test_cases.xlsx                    # 50+ detailed test cases
│
├── bug_reports/
│   └── bug_reports.xlsx                   # 15+ sample bug reports (Jira-style)
│
├── reports/
│   └── test_execution_report.md           # Sample execution summary + metrics
│
├── rtm/
│   └── requirement_traceability_matrix.xlsx
│
├── regression/
│   └── regression_checklist.md
│
├── api_testing/
│   ├── api_test_scenarios.md
│   └── ShopEase_API_Collection.postman_collection.json
│
├── sql/
│   └── db_validation_queries.sql
│
└── screenshots/                           # (placeholder — add real screenshots when you execute)
```

## 5. Tools Used

| Tool | Purpose |
|---|---|
| Excel (.xlsx) | Test case repository, bug tracker, RTM |
| Jira-style fields | Bug report structure (even without a real Jira instance) |
| Postman | API request collection for backend validation |
| MySQL/PostgreSQL syntax SQL | Database validation queries |
| Markdown | All planning documents (SRS, Test Plan, Scenarios, Reports) |

## 6. How to Use This Repository (as a fresher candidate)

1. Read `docs/02_SRS.md` and `docs/03_test_plan.md` first — these show you understand *why*
   you're testing something, not just *how*.
2. Open `test_cases/test_cases.xlsx` — this is your main interview artifact. Be ready to explain
   3–5 test cases in depth, including edge cases and why you chose that test data.
3. Actually **execute** a subset of these test cases yourself on the live OpenCart demo
   (see Section 7 of the Test Plan — "How to Execute This Project Yourself") and fill in real
   Actual Result / Pass-Fail columns. This turns a documentation exercise into real testing
   experience you can speak to.
4. Use `bug_reports/bug_reports.xlsx` as a template — when you find a real bug while executing,
   log it in the same format with a real screenshot in `screenshots/`.
5. Use `api_testing/` and `sql/` to show you understand testing isn't just UI-only.
