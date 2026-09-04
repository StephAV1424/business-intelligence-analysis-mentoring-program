# Conceptual Data Model

## Purpose

Represent the main business entities and their relationships to support the Sales Dashboard solution.

---

# Business Scenario

The Sales Dashboard provides visibility into sales performance across regions, products, customers, and sales representatives.

---

# Entities

## Customer

Represents individuals or organizations that purchase products.

### Key Attributes

- Customer ID
- Customer Name
- Customer Segment
- Customer Status

---

## Product

Represents products offered for sale.

### Key Attributes

- Product ID
- Product Name
- Product Category
- Unit Price

---

## Sales Transaction

Represents each completed sales transaction.

### Key Attributes

- Transaction ID
- Transaction Date
- Quantity Sold
- Revenue Amount

---

## Sales Representative

Represents employees responsible for sales activities.

### Key Attributes

- Sales Rep ID
- Sales Rep Name
- Territory
- Manager

---

## Region

Represents geographical areas where sales occur.

### Key Attributes

- Region ID
- Region Name
- Country
- Sales Target

---

# Relationships

## Region → Sales Representative

**Relationship Type:** One-to-Many (1:M)

A region can contain multiple sales representatives.

Example:

- North Region
  - John Smith
  - Sarah Lee
  - David Brown

---

## Sales Representative → Sales Transaction

**Relationship Type:** One-to-Many (1:M)

A sales representative can create many sales transactions.

Example:

- John Smith
  - Transaction 1001
  - Transaction 1002
  - Transaction 1003

---

## Customer → Sales Transaction

**Relationship Type:** One-to-Many (1:M)

A customer can perform multiple purchases.

Example:

- ABC Corporation
  - Transaction 1001
  - Transaction 1055
  - Transaction 1098

---

## Product → Sales Transaction

**Relationship Type:** One-to-Many (1:M)

A product can appear in many sales transactions