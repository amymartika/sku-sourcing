with on_hand as (
    select
        snapshot_date, 
        concat(product_id, '-', product_size) as sku, 
        product_id, 
        product_size, 
        inventory_channel, 
        node_id, 
        case
            when node_id = '001' then 'Node A'
            when node_id = '002' then 'Node B'
            when node_id = '003' then 'Node C'
            when node_id = '004' then 'Node D'
            when node_id = '005' then 'Node E'
            when node_id = '006' then 'Node F'
            when node_id = '007' then 'Node G'
            when node_id = '008' then 'Node H'
            when node_id = '009' then 'Node I'
            when node_id = '010' then 'Node J'
            when node_id = '011' then 'Node K'
            when node_id = '012' then 'Node L'
        end as node_name, 
        case
            when node_id in ('001', '005', '009', '010') then 'Regional'
            when node_id in ('002', '006', '011') then 'Central'
            else 'Other'
        end as node_type, 
        sum(cast(inventory_qty as integer)) as unit_qty
    from 
        inventory
        
    where
        inventory_id = '123'
        and snapshot_date = current_date - 1
        and country_id = 'US'
        and (
            (node_id in ('001', '005', '009', '010') and inventory_channel in ('Digital', 'General'))
            or (node_id not in ('001', '005', '009', '010') and inventory_channel = 'Digital')
        )
        
    group by 
        1, 2, 3, 4, 5, 6, 7, 8
), 

status as (
    select
        distinct product_id, 
        active_indicator
    from 
        product_status
    
    where 
        country_id = 'US'
), 

sales as (
    select
        distinct concat(digital_product_id, '-', digital_color_id, '-', digital_size_id) as sku,
        round((sum(order_qty) over (
            partition by concat(digital_product_id, '-', digital_color_id, '-', digital_size_id)
        )) / 30) as velocity
    from
        orderbook
        
    where 
        country_id = 'US'
        and cancelled <> 'Y'
        and order_date >= dateadd(dd, -30, getdate())
)

product as (
    select
        distinct d.product_id as product_id, 
        max(d.planning_division_id) as division,
        max(d.category_id) as category,
        max(d.gender_id) as gender, 
        max(p.first_product_offer_date) as fpod
    from 
        demand_list as d
    
    left join
        line_plan as p
    on 
        d.product_id = p.product_id
        
    where
        customer_id = '1234567'
        and channel = 'Digital'
        and contract_type = 'REG'
        and left(demand_id) not like '7%'
        
    group by 
        1
)

select
    inventory.*, 
    case
        when count(distinct inventory.node_id) over (
            partition by inventory.sku
        ) > 1 then 'Multi'
        else 'Single'
    end as sourcing_status, 
    count(distinct case
        when inventory.node_id in ('001', '005', '009', '010') then inventory.node_id end) over (
            partition by inventory.sku
        ) as reg_node_count, 
    product.division, 
    product.category, 
    product.gender, 
    case
        when product.fpod <= current_date - 365 then 'Old'
        when to_char(product.fpod::date, 'mm-dd') between '0816' and '1115' then concat(trim('HO'), trim(extract(year from product.fpod)))
        when to_char(product.fpod::date, 'mm-dd') between '0216' and '0515' then concat(trim('SU'), trim(extract(year from product.fpod)))
        when to_char(product.fpod::date, 'mm-dd') between '0516' and '0815' then concat(trim('FA'), trim(extract(year from product.fpod)))
        when to_char(product.fpod::date, 'mm-dd') between '1215' and '1231' then concat(trim('SP'), trim(extract(year from product.fpod::date + 1)))
        else concat(trim('SP'), trim(extract(year from product.fpod)))
    end as season, 
    status.active_indicator, 
    sales.velocity
from 
    inventory
    
left join 
    status
on 
    status.product_id = inventory.product_id
    
left join 
    sales
on 
    sales.sku = inventory.sku
    
left join 
    product
on 
    product.product_id = inventory.product_id
    
where
    status.active_indicator in ('ACTIVE', 'INACTIVE')
    
order by 
    inventory.sku, inventory.node_id;
