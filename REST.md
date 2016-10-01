# Loupe REST API

## Inventory

### Get all inventory items
`GET /api/inventory`

### Get an inventory item by id
`GET /api/inventory/:id`
#### Required
- `id`: integer

### Create a new inventory item
`POST /api/inventory`
#### Required
- `name`: string
- `quantity`: integer
- `retail_price`: integer (1500 => $15.00)

#### Optional
- `group_id`: integer
- `serial_number`: string
- `description`: string
- `department`: string (don't know what this is yet)
- `type`: string
- `metal`: string
- `stone`: string
- `size`: float
- `wholesale_price`: integer
- `image_url`: string
- `order_id`: integer

### Delete an inventory item
`DELETE /api/inventory/:id`
#### Required
- `id`: integer


## Transactions

### Get all transactions
`GET /api/transactions`

### Get a transaction by id
`GET /api/transactions/:id`
#### Required
- `id`: integer

### Create a new transaction
`POST /api/transactions`
#### Required
- `price`: integer
- `item_id`: integer

### Delete a transaction
`DELETE /api/transactions/:id`
#### Required
- `id`: integer


## Orders

### Get all orders
`GET /api/orders`

### Get an order by id
`GET /api/orders/:id`
#### Required
- `id`: integer

### Create a new order
`POST /api/orders`
#### Required
- `price`: integer
- `supplier_id`: integer
- `date_ordered`: [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)

#### Optional
- `date_received`: [ISO 8061](https://en.wikipedia.org/wiki/ISO_8601)


## User Registrations

### Register a new user
`POST /api/registrations`
#### Required
- `first_name`: string
- `last_name`: string
- `company`: string
- `email`: string
- `password`: string


## Current User

### Get the currently logged in user
`GET /api/current_user`
