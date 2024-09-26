view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [detail*]
  }
  dimension_group: created {
     type: time
     timeframes: [raw, time, date, week, month, quarter, year]
     sql: ${TABLE}.created_at ;;
    convert_tz: no
    drill_fields: [
      order_items.id,
      users.id,
      users.city,
      users.state
    ]
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    drill_fields: [detail*]
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }
<<<<<<< HEAD
  dimension: test {
    type: string
    sql: "<lt><gt>testing nbsdvibwueb nbwubecvuiwbevuwbe hbuwbducbwuiebgvcunwedc hbwducvuwebvuiwbed" ;;
  }
  dimension: testing {
    type: string
    sql: ${test};;
    html: {{rendered_value | replace: "&lt;", "<" | replace: "&gt;", ">"}};;
    drill_fields: [test]
  }
=======

  dimension: conct {
    type: string
    sql: concat(${user_id},  " -- "  ,${status}) ;;
    drill_fields: [detail*]
  }


>>>>>>> e1683a6088d463084ba4df7468b949d4f2a267bf
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
<<<<<<< HEAD
    fields: [
=======

    fields: [conct,
>>>>>>> e1683a6088d463084ba4df7468b949d4f2a267bf
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
