package fregot.examples.demo

import input

#Array with allowed location
allowed_locations = ["westeurope2", "northeurope"]

#Filters out all postgresl servers and assign it to postgresql_db
db_variable[db] {
    db := input.resource_changes[_]
    db.type == "azurerm_postgresql_server"
}

array_contains(arr, elem) {
  arr[_] = elem
}

location_db [msg] {
    db := db_variable[_]
    not array_contains(allowed_locations, db.change.after.location)
    msg = sprintf("only the following locations are allowed: ", ["westeurope"])
}
