include: "/views/users.view.lkml"

view: +users {

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
}
