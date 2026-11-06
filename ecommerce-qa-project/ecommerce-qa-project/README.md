# ShopEase E-Commerce — Manual Software Testing Portfolio Project

A complete, end-to-end **manual QA testing project** built to demonstrate practical software
testing skills for a QA Testing Intern / Fresher role: requirement analysis, test planning,
test case design, defect reporting, traceability, regression testing, API testing, and
database validation.

> 📌 **Honest framing for recruiters/interviewers:** This is a self-driven practice project
> built against a **public e-commerce demo site** (OpenCart demo store), not a real client or
> employer engagement. The planning documents (SRS, Test Plan, Scenarios, Test Cases, RTM,
> Regression Checklist) are original work. The Bug Reports and Test Execution Report contain
> **sample/illustrative data** showing correct format and reasoning — clearly marked as such —
> designed to be replaced with real results once you execute the test cases yourself (see
> `docs/03_test_plan.md`, Section 12, for exact steps).

## 📁 Repository Structure

```
ecommerce-qa-project/
├── README.md
├── docs/
│   ├── 01_project_overview.md     # App requirements + repo guide
│   ├── 02_SRS.md                  # Software Requirement Specification
│   ├── 03_test_plan.md            # Full test plan + "how to execute yourself" guide
│   └── 04_test_scenarios.md       # 50 high-level test scenarios, module-wise
├── test_cases/
│   └── test_cases.xlsx            # 59 detailed test cases (ID, steps, data, expected result...)
├── bug_reports/
│   └── bug_reports.xlsx           # 16 sample Jira-style bug reports
├── reports/
│   └── test_execution_report.md   # Sample execution summary & release recommendation
├── rtm/
│   └── requirement_traceability_matrix.xlsx   # Requirements ↔ Scenarios ↔ Test Cases
├── regression/
│   └── regression_checklist.md    # Priority-tiered regression checklist
├── api_testing/
│   ├── api_test_scenarios.md
│   └── ShopEase_API_Collection.postman_collection.json   # Runnable Postman collection
├── sql/
│   └── db_validation_queries.sql  # Schema + 15 runnable DB validation queries
└── screenshots/                   # Add your own real screenshots here when you execute
```

## 🎯 What This Project Covers

| Deliverable | What it proves you can do |
|---|---|
| SRS | Translate a business idea into testable requirements |
| Test Plan | Plan scope, strategy, risk, environment, entry/exit criteria |
| Test Scenarios | Think at the "what needs testing" level before writing steps |
| 59 Test Cases | Write clear, reproducible, data-driven test steps (positive + negative + boundary) |
| 16 Bug Reports | Report defects the way a real team expects (Jira-style fields, severity vs priority) |
| RTM | Prove every requirement has test coverage — nothing is missed |
| Regression Checklist | Know what to re-test efficiently after a change, not just "test everything again" |
| Test Execution Report | Summarize results and make a release go/no-go call |
| Postman Collection | Test beyond the UI — validate API contracts, status codes, auth |
| SQL Validation Queries | Verify data integrity at the database layer, not just what the screen shows |

## 🚀 Quick Start — How to Actually Use This Project

1. **Read first:** `docs/01_project_overview.md` → `docs/02_SRS.md` → `docs/03_test_plan.md`
2. **Open** `test_cases/test_cases.xlsx` and pick 10–15 cases across 4+ modules
3. **Execute them manually** against https://demo.opencart.com (or your own test site),
   filling in real "Actual Result" and "Status" values
4. **Log real bugs** you find in `bug_reports/bug_reports.xlsx`, following the same format,
   with screenshots saved in `screenshots/`
5. **Run** `regression/regression_checklist.md` once, end to end
6. **Import** `api_testing/ShopEase_API_Collection.postman_collection.json` into Postman and
   run it against `https://fakestoreapi.com` or `https://dummyjson.com`
7. **Run** the queries in `sql/db_validation_queries.sql` against a local sample DB (schema
   included in the file — works on MySQL, PostgreSQL, or SQLite)
8. **Update** `reports/test_execution_report.md` with your real pass/fail numbers

Completing steps 1–8 turns this from a documentation exercise into genuine, interview-ready
hands-on testing experience.

## 🛠️ Tools & Tech Used
Manual Testing · Excel (test case & bug repository) · Jira-style defect fields · Postman
(API testing) · SQL (MySQL/PostgreSQL syntax, SQLite-compatible) · Markdown documentation

## 🗣️ How to Talk About This Project in an Interview

- *"I built a full QA documentation set — SRS, test plan, 59 test cases, and an RTM — for an
  e-commerce site, then executed a subset manually against a live public demo store."*
- *"I found and logged real/sample defects in Jira-style format, including severity vs
  priority reasoning — for example, a payment-decline bug I classified Critical because it
  falsely confirms successful orders."*
- *"I went beyond UI testing — I validated the same flows through Postman API tests and SQL
  queries against the underlying data, to show I understand testing isn't just clicking
  through a browser."*
- *"My regression checklist is prioritized by risk, not just a flat re-run-everything list,
  which is how real teams manage limited regression time before a release."*

## 📄 License / Use
Free to use and adapt for your own learning/portfolio. Replace the sample execution data with
your own real results before presenting this as "executed" work.
