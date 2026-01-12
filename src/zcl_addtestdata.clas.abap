CLASS zcl_addtestdata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CLASS-METHODS fill_ztbl_address
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out
      .
    CLASS-METHODS fill_ztbl_2addr
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out
      .

    CLASS-METHODS maintenance
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out
      .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_addtestdata IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA:
*    out->write( 'it works ' ).

    "fill_ztbl_address( out ).
    "maintenance( out ).
    fill_ztbl_2addr(  out ).


  ENDMETHOD.



  METHOD fill_ztbl_address.


    DATA: lt_country TYPE TABLE OF ztbl_country.
    DATA: lt_city TYPE TABLE OF ztbl_city.
    DATA: lt_street TYPE TABLE OF ztbl_street.

    "out->write( zcl_util=>nr_addr_next(  ) ).
    "out->write( zcl_util=>nr_addr_next(  ) ).

    lt_country = VALUE #(
    (
        client = sy-mandt
        country_id = 49
        country = 'GERMANY'
    )
    (
        client = sy-mandt
        country_id = 1
        country = 'USA'
    )
    ).

    INSERT ztbl_country FROM TABLE @lt_country
    ACCEPTING DUPLICATE KEYS.

    lt_city = VALUE #(
    (
        client = sy-mandt
        country_id = 49
        city_id = zcl_util=>nr_addr_next(  )
        city = 'BERLIN'

     )
    (
        client = sy-mandt
        country_id = 49
        city_id = zcl_util=>nr_addr_next(  )
        city = 'MÜNCHEN'

     )
    (
        client = sy-mandt
        country_id = 49
        city_id = zcl_util=>nr_addr_next(  )
        city = 'STUTGART'

     )
    (
        client = sy-mandt
        country_id = 1
        city_id = zcl_util=>nr_addr_next(  )
        city = 'WASHINGTON'

     )
    ).

    INSERT ztbl_city FROM TABLE @lt_city
    ACCEPTING DUPLICATE KEYS.

*    lt_street = value #(
*    (
*
*    )
*     ).


*    LOOP AT lt_address ASSIGNING FIELD-SYMBOL(<ls_address>).
*
*
*    ENDLOOP.



    out->write( 'end' ).



  ENDMETHOD.

  METHOD maintenance.

    DELETE FROM ztbl_street .
    DELETE FROM ztbl_city.
    DELETE FROM ztbl_country.
    out->write( 'maintenance end' ).

  ENDMETHOD.

  METHOD fill_ztbl_2addr.
    DATA: lt_country TYPE TABLE OF ztbl_2country.
    DATA: lt_city TYPE TABLE OF ztbl_2city.
    DATA: lt_street TYPE TABLE OF ztbl_2street.

    "out->write( zcl_util=>nr_addr_next(  ) ).
    "out->write( zcl_util=>nr_addr_next(  ) ).

    lt_country = VALUE #(
    (
        client = sy-mandt
        country_id = 49
        country = 'GERMANY'
    )
    (
        client = sy-mandt
        country_id = 1
        country = 'USA'
    )
    ).

    INSERT ztbl_2country FROM TABLE @lt_country
    ACCEPTING DUPLICATE KEYS.

    DATA ln_city1 TYPE  zde_bid.
    ln_city1 = zcl_util=>nr_addr_next(  ).
    DATA ln_city2 TYPE  zde_bid.
    ln_city2 = zcl_util=>nr_addr_next(  ).
    DATA ln_city3 TYPE  zde_bid.
    ln_city3 = zcl_util=>nr_addr_next(  ).
    DATA ln_str1 TYPE  zde_bid.
    ln_str1 = zcl_util=>nr_addr_next(  ).
    DATA ln_str2 TYPE  zde_bid.
    ln_str2 = zcl_util=>nr_addr_next(  ).


    lt_city = VALUE #(
    (
        client = sy-mandt
        country_id = 49
        city_id = ln_city1
        city = 'BERLIN'

     )
    (
        client = sy-mandt
        country_id = 49
        city_id = ln_city2
        city = 'MÜNCHEN'

     )
    (
        client = sy-mandt
        country_id = 49
        city_id = ln_city3
        city = 'STUTGART'

     )
    (
        client = sy-mandt
        country_id = 1
        city_id = zcl_util=>nr_addr_next(  )
        city = 'WASHINGTON'

     )
    ).

    INSERT ztbl_city FROM TABLE @lt_city
    ACCEPTING DUPLICATE KEYS.

    lt_street = VALUE #(
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city1
        street  = 'MARKTSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city2
        street  = 'MARKTSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city3
        street  = 'MARKTSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city1
        street  = 'LINDENSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city2
        street  = 'LINDENSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city3
        street  = 'LINDENSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city1
        street  = 'HELLWEGSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city2
        street  = 'HELLWEGSTR'
    )
    (
        street_id = zcl_util=>nr_addr_next(  )
        city_id = ln_city3
        street  = 'HELLWEGSTR'
    )
    ).

    INSERT ztbl_2street FROM TABLE @lt_street
    ACCEPTING DUPLICATE KEYS.

  ENDMETHOD.

ENDCLASS.
