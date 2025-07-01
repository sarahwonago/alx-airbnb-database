# Airbnb Database – Partitioning Performance Report

## Objective
Optimize query performance on the large `Booking` table by applying **range partitioning** based on `start_date`.

---

## Partitioning Strategy

- Table: `Booking`
- Column: `start_date`
- Type: `RANGE` Partitioning
- Example: Monthly partitions for Q1 of 2025

---

## Performance Before Partitioning


