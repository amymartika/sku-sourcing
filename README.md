# SKU Sourcing Dashboard

* **Tools:** SQL (Snowflake), Tableau
* **Project Type:** Data Visualization, Supply Chain

## Table of Contents

1. Background
2. Data Collection
3. Executive Summary
4. Insights Deep Dive
5. Recommendations
6. Clarifying Questions & Assumptions

### Background
The supply chain team for our website is focused on achieving one hero goal: get product to consumers within 4 days of order placement. In late September, this goal is particularly important as we anticipate a strong increase in holiday orders. We have an "Under The Tree" (UTT) target of 95% — consumers who place their orders by the deadline receive their orders before Christmas. 

One key factor in delivery times is the storage of product across nodes in the supply chain network. Primary nodes can hold more product over a longer period of time, while regional nodes enable quicker delivery to consumers across North America. Regional nodes are meant to stock inventory with a quick turnover. 

A senior manager from an inventory fulfillment team is trying to gain a better understanding of our SKU breadth across the network. She'll be coordinating with operations teams to move the right inventory to the right place at the right time and would like a dashboard that answers the following questions: 

* How do our SKUs break out in terms of being single-sourced (from one node) vs multi-sourced (multiple nodes)? How does this break out when focusing specifically on our 4 regional nodes?
* Where is the multi-sourced ivnentory held? What are the overlaps?
* What areas of opportunity do we have to increase SKU breadth across regional nodes?

She'd like to get immediate, actionable insights in preparation for the holiday season. She'd also like the dashboard by a variety of dimensions, such as gender and product type, so that she can monitor SKU status each week and make strategic decisions around inventory movement. 

### Data Collection

### Executive Summary

<img src = "[https://github.com/amymartika/sku-sourcing/blob/main/SKU%20Sourcing%20ERD%20-%20Page%201.png](https://github.com/amymartika/sku-sourcing/blob/main/SKU%20Sourcing%20ERD%20-%20Page%201%20(1).png)"/>

### Insights Deep Dive

* SKUs for the upcoming season are largely sourced from primary nodes or 1 regional node, with 52% of unique SKUs on-hand at 0 regional nodes and 20% of unique SKUs on-hand at only 1 regional node.
* High-velocity SKUs, which have an average of 20 sales per week, are more single-sourced than low-velocity SKUs (68% vs 42%). We can focus our efforts on broadening high-velocity SKUs to have a higher impact on delivery times for consumers.
* Total unit breadth is stronger than unique SKU breadth. Our teams have typically tackled this issue from a unit perspective - but we have 92% multi-sourced units and only 64% multi-sourced unique SKUs.

### Recommendations
The dashboard also features a SKU export page. Users can view a comprehensive list of single-sourced SKUs, including their location node, sales velocity, season of release, and total units. Users can filter this list to any specific node and export records to Excel. Emphasis on launch as well.  

### Clarifying Questions & Assumptions

*Data points have been anonymized. The specific values have been adjusted to illustrate real insights and recommendations while protecting sensitive company data.*
