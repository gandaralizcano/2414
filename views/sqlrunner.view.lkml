view: sql_runner {
  derived_table: {
    sql: SELECT
          orders.status  AS `orders.status`,
          orders.id  AS `orders.id`,
          orders.user_id  AS `orders.user_id`,
          COUNT(*) AS `orders.count`
      FROM demo_db.orders  AS orders
      GROUP BY
          1,
          2,
          3
      ORDER BY
          4 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

dimension: concat {
  type: string
  sql: concat(${orders_id},  " -- ",${orders_status});;
  drill_fields: [detail*]
}

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
  }

  dimension: orders_user_id {
    type: number
    sql: ${TABLE}.`orders.user_id` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  set: detail {
    fields: [concat,
      orders_status,
      orders_id,
      orders_user_id,
      orders_count
    ]
  }
}
