view: flights {
  sql_table_name: demo_db.flights ;;

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }
  dimension_group: arr {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.arr_time ;;
  }
  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }
  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }
  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }
  dimension_group: dep {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dep_time ;;
  }

  dimension: dep2 {
    type: date_time
    #timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dep_time ;;
  }


  dimension: destination {
    type: string
    sql:

    {% if destination._is_filtered or (_user_attributes['car_hr_geographical_entity'] <> 'NOT_AVAILABLE' and _user_attributes['car_hr_is_insider'] <> 'TRUE') %}
          CASE WHEN ${TABLE}.destination = "JAC" THEN

            ${TABLE}.destination
          ELSE
            ${TABLE}.carrier
          END
    {% elsif origin._is_filtered or (_user_attributes['car_hr_geographical_region'] <> 'NOT_AVAILABLE' and _user_attributes['car_hr_is_insider'] <> 'TRUE') %}
         ${TABLE}.destination
    {%else%}
       ${TABLE}.origin
     {%endif%};;

    #html: <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p> ;;
    #<h5 style='text-align: center;'>{{ rendered_value }}</h5>;;
    html: <h5 style="vertical-align: center;"> {{value}} </h5> ;;
    #html: <span style="color:darkred;">{{ rendered_value }}</span>;;
    #html: <p style="vertical-align:middle">{{ rendered_value }}</p> ;;
   # html: <h5 style="vertical-align: center;"> {{value}} </h5> ;;

  }
  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }
  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }
  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }
  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }
  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }
  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }
  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }
  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }
  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
  }
  measure: count {
    type: count

    #html: <h5 style="vertical-align: left;"> {{value}} </h5> ;;
  }
}
