# Software Requirement Specification (SRS)
## ShopEase E-Commerce Website

**Document Version:** 1.0
**Prepared by:** Laraib Ali (QA Testing Intern — Portfolio Project)
**Reference Application:** OpenCart Demo Store (https://demo.opencart.com)

---

### 1. Introduction

#### 1.1 Purpose
This SRS defines the functional and non-functional requirements of the ShopEase e-commerce
platform, used as the baseline against which all test scenarios, test cases, and the
Requirement Traceability Matrix (RTM) in this project are built.

#### 1.2 Scope
ShopEase is a B2C e-commerce web application allowing customers to browse products, manage a
cart and wishlist, check out, pay, and track orders. It includes a customer-facing storefront
and a basic admin panel for product/inventory management.

#### 1.3 Intended Audience
QA Engineers, Developers, Business Analysts, and reviewers evaluating this testing portfolio.

---

### 2. Functional Requirements

| Req ID | Requirement Description |
|--------|--------------------------|
| REQ-01 | User shall be able to register a new account with name, email, and password |
| REQ-02 | System shall validate email format and enforce password complexity (min 8 chars, 1 number, 1 special char) |
| REQ-03 | User shall be able to log in with valid registered credentials |
| REQ-04 | System shall lock/warn after repeated failed login attempts (basic brute-force protection) |
| REQ-05 | User shall be able to reset a forgotten password via registered email |
| REQ-06 | User shall be able to browse products by category |
| REQ-07 | User shall be able to search products by keyword |
| REQ-08 | System shall display "No results found" for invalid/empty search queries |
| REQ-09 | User shall be able to filter and sort product listings (price, name, rating) |
| REQ-10 | User shall be able to view full product details (price, description, images, stock status) |
| REQ-11 | User shall be able to add a product to the cart |
| REQ-12 | User shall be able to update quantity or remove a product from the cart |
| REQ-13 | Cart shall persist product data correctly when quantity/price changes |
| REQ-14 | System shall prevent adding out-of-stock products to the cart |
| REQ-15 | User shall be able to add/remove products to/from a Wishlist |
| REQ-16 | User shall be able to apply a valid coupon code at checkout |
| REQ-17 | System shall reject expired/invalid coupon codes with a clear error message |
| REQ-18 | User shall be able to enter/select a shipping address during checkout |
| REQ-19 | User shall be able to select a shipping method, and shipping cost shall update accordingly |
| REQ-20 | User shall be able to select a payment method (Credit/Debit Card, COD, PayPal) |
| REQ-21 | System shall validate card details (number, expiry, CVV) before processing payment |
| REQ-22 | System shall show an order confirmation page with order ID after successful checkout |
| REQ-23 | System shall send an order confirmation email (verified via UI message / mock, not a real mail) |
| REQ-24 | User shall be able to view past orders and their status in Order History |
| REQ-25 | User shall be able to cancel an order that is still in "Processing" status |
| REQ-26 | User shall be able to download/view an invoice for a completed order |
| REQ-27 | User shall be able to edit profile details and manage saved addresses |
| REQ-28 | User shall be able to change their account password |
| REQ-29 | Admin shall be able to add, edit, and delete a product listing |
| REQ-30 | Admin shall be able to update stock quantity, and storefront shall reflect it in near real-time |
| REQ-31 | User shall be able to submit a star rating and text review for a purchased product |
| REQ-32 | System shall calculate and display the average rating per product |
| REQ-33 | All monetary values shall be displayed with correct currency and 2 decimal precision |
| REQ-34 | System shall recalculate cart/order totals correctly after any tax, discount, or shipping change |

### 3. Non-Functional Requirements

| Req ID | Requirement Description |
|--------|--------------------------|
| NFR-01 | Page load time shall not exceed 3 seconds under normal load |
| NFR-02 | Application shall be responsive across desktop, tablet, and mobile viewports |
| NFR-03 | Application shall be compatible with Chrome, Firefox, Edge, and Safari (latest 2 versions) |
| NFR-04 | Passwords shall be stored hashed, never in plain text |
| NFR-05 | Session shall expire after a defined period of inactivity |
| NFR-06 | Application shall handle at least 100 concurrent users without critical failure (perf — out of manual scope, noted for reference) |
| NFR-07 | All user-facing error messages shall be clear, specific, and non-technical |
| NFR-08 | Application shall be usable via keyboard navigation for core flows (basic accessibility) |

### 4. Assumptions and Constraints

- Testing is performed manually against a publicly available demo instance; no access to
  production logs, real payment gateways, or internal source code.
- Payment gateway testing uses **test/sandbox card numbers only** — never real card data.
- API and SQL deliverables in this project are **illustrative templates** showing the correct
  approach; they assume a typical REST API and relational schema an e-commerce backend would
  expose, since this demo site's internal API/DB is not publicly exposed for testing.

### 5. Out of Scope

- Load/performance/stress testing (mentioned in NFR-06 but not executed manually here)
- Security penetration testing
- Native mobile app testing (web responsive only)
- Multi-language/localization testing
