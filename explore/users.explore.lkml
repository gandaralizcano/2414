include: "/views/users.view.lkml"
include: "/views/refinement.view.lkml"

explore: users {

  label: "USERS"


  access_filter: {
    field: state
    user_attribute: carrier
  }
  }
