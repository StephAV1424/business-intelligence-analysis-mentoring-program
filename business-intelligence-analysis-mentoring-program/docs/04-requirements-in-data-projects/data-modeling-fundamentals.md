# Data Modeling Fundamentals

## Overview

Data modeling is the process of defining how business information is organized, related, and stored.

A Business Intelligence Analyst uses data models to translate business requirements into a structure that can be implemented in databases, data warehouses, and reporting solutions.

Understanding entities, attributes, and relationships is the foundation of data modeling.

---

# Key Concepts

## Entity

An entity is a business object, person, place, event, or concept that is important to the organization and requires information to be stored.

### Examples

- Customer
- Product
- Order
- Employee
- Supplier

### Business Example

A sales organization needs to store information about customers.

Therefore:

```text
Customer
```

becomes an entity.

---

## Attribute

An attribute is a characteristic or property that describes an entity.

### Examples

For the Customer entity:

```text
Customer
---------------
Customer_ID
Customer_Name
Email
Region
Customer_Type
```

The attributes are:

- Customer_ID
- Customer_Name
- Email
- Region
- Customer_Type

---

# Entity vs Attribute

Think of it this way:

Entity = The thing

Attribute = Information about the thing

### Example

Entity:

```text
Product
```

Attributes:

```text
Product_ID
Product_Name
Category
Unit_Price
```

The product is the entity.

The details that describe the product are attributes.

---

# How to Identify Entities

A useful technique is to listen for nouns during requirements discussions.

### Stakeholder Statement

> We need to analyze sales by customer and product.

Potential entities:

```text
Customer
Product
Sales
```

---

# How to Identify Attributes

Look for descriptive information.

### Stakeholder Statement

> We need the customer's name, region, and industry.

Potential attributes:

```text
Customer_Name
Region
Industry
```

These describe the Customer entity.

---

# Relationships

Entities are connected through relationships.

### Example

A customer places orders.

```text
Customer
   |
 Places
   |
Order
```

The relationship explains how entities interact.

---

# Conceptual Data Model

The conceptual model provides a high-level business view.

### Purpose

Answer the question:

> What business objects exist?

### Example

```text
Customer
   |
Order
   |
Product
```

### Characteristics

- High-level
- Business-focused
- No technical details
- No attributes

### Audience

- Business Stakeholders
- Product Owners
- Business Analysts

---

# Logical Data Model

The logical model introduces business details.

### Purpose

Answer the question:

> What information needs to be stored?

### Example

```text
Customer
-----------------
Customer_ID
Customer_Name
Region

Order
-----------------
Order_ID
Order_Date

Product
-----------------
Product_ID
Product_Name
Category
```

### Characteristics

- Includes attributes
- Includes primary keys
- Includes foreign keys
- Technology independent

### Audience

- Business Analysts
- Data Analysts
- Solution Architects

---

# Physical Data Model

The physical model describes database implementation.

### Purpose

Answer the question:

> How will this be implemented?

### Example

```sql
CREATE TABLE DimCustomer (
   CustomerKey INT,
   CustomerID INT,
   CustomerName VARCHAR(100),
   Region VARCHAR(50)
);
```

### Characteristics

- Data types
- Constraints
- Database tables
- Foreign keys
- Indexes

### Audience

- Database Developers
- Data Engineers
- Database Administrators

---

# Sales Dashboard Example

## Conceptual Model

```text
Customer
   |
Order
   |
Product

Sales Representative
```

Business entities only.

---

## Logical Model

```text
Customer
---------------
Customer_ID
Customer_Name
Region

Order
---------------
Order_ID
Order_Date

Product
---------------
Product_ID
Product_Name

Sales_Representative
---------------
SalesRep_ID
Rep_Name
```

Business attributes are introduced.

---

## Physical Model

```text
DimCustomer
DimProduct
DimSalesRep
FactSales
```

Database implementation begins.

---

# Comparison of Data Models

| Model | Focus | Level of Detail | Technology Dependent |
|---------|---------|---------|---------|
| Conceptual | Business View | Low | No |
| Logical | Business Data Structure | Medium | No |
| Physical | Database Implementation | High | Yes |

---

# Interview Question Example

## Question

What is the difference between an entity and an attribute?

## Answer

An entity represents a business object that is important to the organization and needs to be tracked, such as a Customer, Product, or Order.

An attribute represents information that describes the entity. For example, a Customer entity may have attributes such as Customer ID, Customer Name, Region, and Customer Type.

---

# Key Takeaways

- Entities represent business objects.
- Attributes describe entities.
- Relationships connect entities.
- Conceptual models show business objects.
- Logical models add attributes and relationships.
- Physical models define database implementation.

These concepts form the foundation of data modeling and are essential skills for a Business Intelligence Analyst.

# Metadata

## What is Metadata?

Metadata is information that describes, defines, and provides context about data.

It is commonly referred to as:

> Data about data.

Metadata helps business users, analysts, data engineers, and stakeholders understand the meaning, structure, quality, ownership, and usage of data.

---

## Example: Data vs Metadata

### Data

| Customer_ID | Customer_Name | Region |
|------------|---------------|---------|
| 1001 | John Smith | North |
| 1002 | Sarah Lee | South |

The actual values are data.

---

### Metadata

For the column `Customer_ID`:

```text
Column Name: Customer_ID
Data Type: Integer
Description: Unique customer identifier
Nullable: No
Primary Key: Yes
```

This descriptive information is metadata.

---

# Metadata and Entities

Consider the following entity:

```text
Customer
```

Attributes:

```text
Customer_ID
Customer_Name
Region
Industry
```

Metadata describes those attributes.

Example:

```text
Attribute: Customer_Name
Data Type: VARCHAR(100)
Description: Official customer name
Business Owner: Sales Department
```

---

# Types of Metadata

## Business Metadata

Business metadata explains the meaning of data in business terms.

### Example

```text
Metric Name: Sales Amount

Definition:
Total revenue generated from completed sales transactions.

Owner:
Sales Department
```

Business analysts frequently work with this type of metadata.

---

## Technical Metadata

Technical metadata describes how data is stored and structured.

### Example

```text
Table:
FactSales

Column:
SalesAmount

Data Type:
DECIMAL(18,2)
```

Technical metadata is commonly used by Data Engineers and Database Administrators.

---

## Operational Metadata

Operational metadata describes process and execution information.

### Example

```text
Data Refresh Time:
Daily at 6:00 AM

Records Processed:
125,450

Last Refresh:
2026-09-03
```

This type of metadata is important for monitoring data pipelines.

---

# Metadata in Data Warehousing

Metadata is heavily used in data warehouse environments.

Example:

```text
FactSales

Business Description:
Stores transactional sales activity.

Refresh Frequency:
Daily

Source System:
CRM Application

Data Owner:
Sales Operations
```

Metadata helps users understand where data originates and how it should be used.

---

# Metadata and Data Governance

Metadata plays a critical role in governance activities.

It helps define:

- Data ownership
- Business definitions