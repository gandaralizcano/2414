view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  parameter: test_param {
    allowed_value: { value: "Completed"}
    allowed_value: { value: "Cancelled"}
    allowed_value: { value: "Pending"}
  }
  dimension: test {
    sql: case
          when {% parameter test_param %} = "Completed" THEN
                ${order_items.sale_price}
          when {% parameter test_param %} = "Cancelled" THEN
                ${products.retail_price}
          when {% parameter test_param %} = "Pending" THEN
                ${products.rank}
          ELSE NULL
          END;;
  }


  measure: test_1 {
    type: sum
    sql: 1 ;;
    html:
    <html>
    <p class title= {{ maxmind_geolocation_activity.count._value }}> {{linked_value}} </p>
    </html> ;;
    link: {
      label: "Customer List"
      url: "{% assign vis_config = '{\"type\":\"single_value\"}' %}
          {{ drill_by_member_email._link }}&vis_config={{ vis_config | encode_uri }}&{{value | divided_by: 1000000 | round:2 }}&toggle=dat,pik,vis&limit=5000"
    }
    value_format: "0.000,,\" M\""
      }
  measure: drill_by_member_email {
    type: sum
    sql: 0 ;;
    drill_fields: [test_1]
    view_label: "_Measures"
    hidden: yes
    #value_format: "0"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }


  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
