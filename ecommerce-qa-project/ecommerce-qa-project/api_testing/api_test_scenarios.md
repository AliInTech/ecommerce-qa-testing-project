# API Testing Scenarios — ShopEase Backend

> **Note:** OpenCart's public demo doesn't expose a documented REST API for outside testers.
> This collection is written **generically** against a typical e-commerce REST API shape so it
> can be pointed at a real practice API. Two good free options to actually run this against:
> - `https://fakestoreapi.com` (products, carts, users, auth)
> - `https://dummyjson.com` (products, carts, auth with real login flow)
>
> Import `ShopEase_API_Collection.postman_collection.json` into Postman, set the `base_url`
> collection variable to one of the above, and run the requests — this is designed to be
> **actually executable**, not just a template to read.

## Scenario Group 1: Products

| ID | Scenario | Method & Endpoint | Expected Status | Key Assertions |
|---|---|---|---|---|
| API-01 | Get all products | GET `/products` | 200 | Response is an array; each item has `id`, `title`, `price` |
| API-02 | Get a single valid product | GET `/products/{id}` | 200 | Returned `id` matches requested `id` |
| API-03 | Get a non-existent product | GET `/products/999999` | 404 (or empty body per API) | Error message present; no server error (500) |
| API-04 | Get products with limit param | GET `/products?limit=5` | 200 | Response array length ≤ 5 |
| API-05 | Get all product categories | GET `/products/categories` | 200 | Response is a non-empty array of strings |

## Scenario Group 2: Authentication

| ID | Scenario | Method & Endpoint | Expected Status | Key Assertions |
|---|---|---|---|---|
| API-06 | Login with valid credentials | POST `/auth/login` | 200 | Response contains a non-empty `token` field |
| API-07 | Login with invalid password | POST `/auth/login` | 401/400 | Response contains an error message; no token returned |
| API-08 | Login with missing required field | POST `/auth/login` (no `password`) | 400 | Validation error returned, no server crash |

## Scenario Group 3: Cart

| ID | Scenario | Method & Endpoint | Expected Status | Key Assertions |
|---|---|---|---|---|
| API-09 | Create a new cart | POST `/carts` | 200/201 | Response contains cart `id` and submitted `products` array |
| API-10 | Get a user's carts | GET `/carts/user/{userId}` | 200 | Response array contains carts belonging to that user only |
| API-11 | Update an existing cart | PUT `/carts/{id}` | 200 | Updated product list is reflected in response |
| API-12 | Delete a cart | DELETE `/carts/{id}` | 200 | Response confirms deletion; subsequent GET for same ID behaves per API docs |

## Scenario Group 4: Users

| ID | Scenario | Method & Endpoint | Expected Status | Key Assertions |
|---|---|---|---|---|
| API-13 | Get all users | GET `/users` | 200 | Response is an array of user objects (no plaintext password exposed, ideally) |
| API-14 | Get a single user | GET `/users/{id}` | 200 | Returned `id` matches requested `id` |
| API-15 | Create a new user | POST `/users` | 200/201 | Response echoes submitted fields and includes a new `id` |

## Non-functional / Negative API Checks (apply across all endpoints)
- Response time is reasonable (flag anything > 2–3 seconds)
- Content-Type header is `application/json`
- Invalid/malformed JSON body in a POST/PUT returns 400, not 500
- SQL-injection-style strings in query params/body are safely handled, not reflected raw in
  error messages (basic negative check — not a substitute for real security testing)

## How to Run This in Postman
1. Open Postman → Import → select `ShopEase_API_Collection.postman_collection.json`.
2. Click the imported collection → **Variables** tab → set `base_url` to
   `https://fakestoreapi.com` (or `https://dummyjson.com`).
3. For `dummyjson.com`, use documented test credentials (e.g., username `emilys`,
   password `emilyspass`) for the login request — check their docs for current test users.
4. Run requests individually, or click **Run Collection** to execute all requests with the
   built-in test assertions and see a pass/fail summary.
5. Each request includes a **Tests** tab script that checks status code and basic response
   shape — this is what makes the run "real" rather than just manual clicking.
