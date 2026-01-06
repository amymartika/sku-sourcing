# SKU Sourcing Dashboard

* **Tools:** SQL (Snowflake), Tableau
* **Project Type:** Data Visualization

## Table of Contents

1. Background
2. Executive Summary
3. Insights Deep Dive
4. Recommendations
5. Clarifying Questions & Assumptions

### Background

* What percent of our unique SKUs are single-sourced vs multi-sourced?
* What percent of our unique SKUs are available across 4, 3, 2, 1, or 0 RSCs?
* Where does multi-sourced inventory come from and where does it overlap?
* What areas of opportunity do we have to increase SKU breadth across RSCs? 

### Executive Summary

<p align = "center"> 
<img src = "[https://github.com/amymartika/sku-sourcing/blob/main/SKU%20Sourcing%20ERD%20-%20Page%201.png](https://github.com/amymartika/sku-sourcing/blob/main/SKU%20Sourcing%20ERD%20-%20Page%201%20(1).png)"/>
</p> 

### Insights Deep Dive

* SKUs for the upcoming season are largely sourced from primary nodes or 1 regional node, with 52% of unique SKUs on-hand at 0 regional nodes and 20% of unique SKUs on-hand at only 1 regional node.
* High-velocity SKUs, which have an average of 20 sales per week, are more single-sourced than low-velocity SKUs (68% vs 42%). We can focus our efforts on broadening high-velocity SKUs to have a higher impact on delivery times for consumers.
* Total unit breadth is stronger than unique SKU breadth. Our teams have typically tackled this issue from a unit perspective - but we have 92% multi-sourced units and only 64% multi-sourced unique SKUs.

### Recommendations
The dashboard also features a SKU export page. Users can view a comprehensive list of single-sourced SKUs, including their location node, sales velocity, season of release, and total units. Users can filter this list to any specific node and export records to Excel. 

### Clarifying Questions & Assumptions

*Data points have been anonymized. The specific values have been adjusted to illustrate real insights and recommendations while protecting sensitive company data.*
