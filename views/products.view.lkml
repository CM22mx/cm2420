view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  parameter: usr_dim_selection {
    label: "User Dim Selection (spanish)"
    view_label: "Products"
    #description: "Choose which cohort you would like to break out the metrics by."
    type: string
    default_value: "Marca"
    allowed_value: {value: "Marca"}
    allowed_value: {value: "Categoria"}
    allowed_value: {value: "Departamento"}
  }

  dimension: usr_dim__display{
    label: "User Dim Selection (spanish) Display"
    view_label: "Products"
    label_from_parameter: usr_dim_selection
    type: string
    sql:
    CASE WHEN ({% parameter usr_dim_selection %} = 'Marca') THEN ${TABLE}.brand
         WHEN ({% parameter usr_dim_selection %} = 'Categoria') THEN ${TABLE}.category
         WHEN ({% parameter usr_dim_selection %} = 'Departamento') THEN ${TABLE}.department

    END;;
  }

}
