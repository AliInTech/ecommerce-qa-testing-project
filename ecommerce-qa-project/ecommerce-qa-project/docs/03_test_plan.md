# Test Plan — ShopEase E-Commerce Website

**Document Version:** 1.0 | **Author:** Laraib Ali | **Status:** For Portfolio/Demonstration Use

---

### 1. Introduction
This Test Plan defines the scope, approach, resources, and schedule of testing activities for
the ShopEase e-commerce platform (tested against the OpenCart public demo store), covering web
UI, API, and database validation layers.

### 2. Objectives
- Verify all core e-commerce flows function per the SRS (`docs/02_SRS.md`).
- Identify, document, and track defects in a standard Jira-style format.
- Build a reusable Regression Checklist for future releases.
- Demonstrate layered testing: UI (manual) + API (Postman) + DB (SQL).

### 3. Scope

**In Scope:**
Registration & Login, Product Browsing & Search, Cart, Wishlist, Checkout, Payment, Order
Management, Coupons, Profile Management, Admin Product Management, Reviews & Ratings.

**Out of Scope:**
Performance/load testing, security penetration testing, native mobile apps, localization.
(See SRS Section 5.)

### 4. Test Strategy / Levels of Testing

| Level | Description | Owner in a real team |
|---|---|---|
| Unit Testing | Individual function/component correctness | Developers |
| Integration Testing | Module-to-module data flow (e.g., Cart → Checkout) | Dev/QA |
| **System Testing** | **End-to-end functional testing — primary focus of this project** | **QA (this project)** |
| Regression Testing | Re-verify unaffected areas after a change | QA (this project) |
| UAT | Business/user sign-off | Product/Client |

### 5. Types of Testing Performed in This Project

- Functional Testing (positive & negative test cases)
- Boundary Value Analysis & Equivalence Partitioning (e.g., password length, quantity limits)
- UI/Usability Testing (basic)
- Cross-browser / Responsive checks (manual, spot-checked)
- API Testing (Postman — status codes, response schema, auth)
- Database Validation (SQL — data integrity after UI actions)
- Regression Testing (checklist-driven)
- Smoke Testing (critical-path subset before deeper regression)

### 6. Entry & Exit Criteria

**Entry Criteria**
- SRS and Test Scenarios finalized
- Test environment (demo URL) accessible
- Test data prepared (sample users, products, coupons)

**Exit Criteria**
- 100% of planned test cases executed (or documented as blocked/skipped with reason)
- No open **Critical** or **High**-severity defects without a documented workaround
- Test Execution Report and RTM signed off

### 7. Test Environment

| Item | Detail |
|---|---|
| Application URL | https://demo.opencart.com (or your chosen demo/staging URL) |
| Browsers | Chrome (primary), Firefox, Edge |
| Devices | Desktop (1920x1080), Mobile viewport (375x812 via DevTools) |
| Test Data | Dummy accounts, dummy addresses, sandbox/test card numbers only |
| Bug Tracking | Excel (Jira-style columns) — `bug_reports/bug_reports.xlsx` |
| API Tool | Postman |
| DB Tool | Any SQL client (MySQL Workbench / pgAdmin) against a local sample schema |

### 8. Roles & Responsibilities (solo-project mapping)

| Role | Real-world owner | In this solo project |
|---|---|---|
| Test Lead | Senior QA | Laraib Ali |
| Test Designer | QA Engineer | Laraib Ali |
| Tester (Executor) | QA Engineer | Laraib Ali |
| Bug Reporter | QA Engineer | Laraib Ali |

### 9. Risk & Mitigation

| Risk | Mitigation |
|---|---|
| Demo site data resets periodically | Re-verify test data/preconditions before each session |
| No real payment gateway access | Use sandbox/test cards; document card numbers used |
| No access to real backend/DB | Treat SQL deliverable as an illustrative template against a documented sample schema |
| Limited time as a solo tester | Prioritize test cases by risk (Critical/High severity modules first — Checkout, Payment, Cart) |

### 10. Deliverables

SRS, Test Plan, Test Scenarios, Test Cases (50+), Bug Reports (15+), Test Execution Report,
RTM, Regression Checklist, Postman Collection, SQL Validation Scripts, README.

### 11. Schedule (sample, for a solo fresher project)

| Phase | Duration |
|---|---|
| Requirement study & SRS | Day 1 |
| Test Plan & Test Scenarios | Day 1–2 |
| Test Case Design (50+ cases) | Day 2–3 |
| Test Execution (manual, on demo site) | Day 3–4 |
| Bug Logging & Retest | Day 4 |
| API & SQL Testing | Day 5 |
| Reporting & RTM | Day 5–6 |

---

## 12. How to Execute This Project Yourself (step-by-step)

This is the part that turns this repo from "documentation only" into **real testing
experience**. Follow this sequence:

1. **Open the AUT.** Go to `https://demo.opencart.com` (storefront) — this resets periodically
   since it's a shared public demo, so don't be surprised if data you added earlier is gone.
2. **Pick 10–15 test cases** from `test_cases/test_cases.xlsx` across at least 4 modules
   (e.g., Search, Cart, Checkout, Registration).
3. **Execute each step literally** as written in the "Test Steps" column, using the exact
   "Test Data" given (or your own equivalent dummy data).
4. **Record the real outcome** in the "Actual Result" and "Status" columns — don't assume Pass;
   actually look at what the page shows.
5. **When actual ≠ expected**, that's a real bug. Log it in `bug_reports/bug_reports.xlsx`
   using the same columns, take a screenshot, save it in `screenshots/`, and reference the
   filename in the bug's "Attachments" note.
6. **Re-test** after you'd normally expect a fix (on a real project this is after a dev fix;
   here, simulate it by re-running the same case a day later or after a page refresh/retry).
7. **Run the Regression Checklist** (`regression/regression_checklist.md`) once, ticking off
   each item — this shows you understand regression testing isn't re-running *everything*,
   it's re-running what's *at risk*.
8. **Try the API collection** in Postman against any public e-commerce-style test API (e.g.
   `https://fakestoreapi.com` or `https://dummyjson.com/products`) — the collection structure
   in this repo is written generically so you can point it at either.
9. **Run the SQL scripts** against a sample schema you create locally (a free MySQL/PostgreSQL
   install, or even SQLite) — the scripts include the `CREATE TABLE` statements needed to try
   them yourself.
10. **Fill in `reports/test_execution_report.md`** with your real pass/fail counts once you've
    executed your subset — replace the sample numbers with your actual ones.

Doing steps 1–10 with even 10–15 test cases gives you genuine, speakable testing experience:
*"I manually tested the checkout and cart flows on a live demo store, logged X real defects,
and validated backend behavior with Postman and SQL."*
