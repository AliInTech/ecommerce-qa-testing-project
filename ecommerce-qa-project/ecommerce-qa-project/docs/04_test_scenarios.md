# Test Scenarios — ShopEase E-Commerce Website

High-level scenarios (the "what to test" layer, before detailed step-by-step test cases).
Each scenario maps to one or more Requirement IDs from the SRS and one or more detailed
test cases in `test_cases/test_cases.xlsx` (see the RTM for the full mapping).

## Module 1: Registration & Login (REQ-01 to REQ-05)
- TS-01: Verify user registration with valid details
- TS-02: Verify registration validations (duplicate email, weak password, invalid email format)
- TS-03: Verify login with valid and invalid credentials
- TS-04: Verify "Forgot Password" flow
- TS-05: Verify logout functionality and session termination

## Module 2: Product Catalog & Search (REQ-06 to REQ-10)
- TS-06: Verify browsing products by category
- TS-07: Verify keyword search returns relevant results
- TS-08: Verify search with no matching results shows an appropriate message
- TS-09: Verify sorting (price low-high, high-low, name) and filtering
- TS-10: Verify product detail page shows correct price, description, images, stock status

## Module 3: Shopping Cart (REQ-11 to REQ-14)
- TS-11: Verify adding a product to cart updates cart count and total
- TS-12: Verify updating quantity recalculates line total and cart total
- TS-13: Verify removing a product from cart
- TS-14: Verify out-of-stock product cannot be added to cart
- TS-15: Verify cart persists across page navigation/refresh

## Module 4: Wishlist (REQ-15)
- TS-16: Verify adding/removing a product from Wishlist
- TS-17: Verify moving a product from Wishlist to Cart

## Module 5: Coupons & Discounts (REQ-16, REQ-17)
- TS-18: Verify applying a valid coupon reduces total correctly
- TS-19: Verify expired/invalid coupon is rejected with a clear message
- TS-20: Verify removing an applied coupon reverts total

## Module 6: Checkout & Payment (REQ-18 to REQ-23, REQ-34)
- TS-21: Verify checkout flow with address entry and shipping method selection
- TS-22: Verify shipping cost updates based on shipping method chosen
- TS-23: Verify payment with valid card details succeeds
- TS-24: Verify payment with invalid/declined card details is handled gracefully
- TS-25: Verify Cash on Delivery (COD) order flow
- TS-26: Verify order confirmation page and order ID generation
- TS-27: Verify total recalculation after tax/discount/shipping changes

## Module 7: Order Management (REQ-24 to REQ-26)
- TS-28: Verify Order History lists all past orders with correct status
- TS-29: Verify order cancellation for an order in "Processing" status
- TS-30: Verify cancellation is blocked for a shipped/delivered order
- TS-31: Verify invoice download/view for a completed order

## Module 8: Profile Management (REQ-27, REQ-28)
- TS-32: Verify editing profile details (name, phone, email)
- TS-33: Verify adding/editing/deleting a saved address
- TS-34: Verify password change with correct old password
- TS-35: Verify password change fails with incorrect old password

## Module 9: Admin — Product Management (REQ-29, REQ-30)
- TS-36: Verify admin can add a new product
- TS-37: Verify admin can edit an existing product's price/details
- TS-38: Verify admin can delete a product
- TS-39: Verify stock update by admin reflects on storefront

## Module 10: Reviews & Ratings (REQ-31, REQ-32)
- TS-40: Verify submitting a star rating and review for a product
- TS-41: Verify average rating recalculates after a new review
- TS-42: Verify review submission validation (empty review, no rating selected)

## Module 11: Cross-cutting / Non-Functional (NFR-01 to NFR-08)
- TS-43: Verify responsive layout on mobile viewport for key pages
- TS-44: Verify application behavior across Chrome, Firefox, Edge
- TS-45: Verify generic error messages are user-friendly and non-technical
- TS-46: Verify session expiry after prolonged inactivity

## Module 12: API Layer (backend validation)
- TS-47: Verify GET products API returns correct schema and status code
- TS-48: Verify POST login API returns valid auth token for correct credentials
- TS-49: Verify POST login API returns 401 for invalid credentials
- TS-50: Verify GET single product API returns 404 for an invalid product ID

---
**Total Scenarios: 50** — expanded into 50+ granular, step-by-step test cases in
`test_cases/test_cases.xlsx`.
