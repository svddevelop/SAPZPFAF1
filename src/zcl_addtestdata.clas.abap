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

    fill_ztbl_address( out ).
    "maintenance( out ).


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

*    DELETE FROM ztbl_address WHERE id >= 21.
*    out->write( 'maintenance end' ).

  ENDMETHOD.

ENDCLASS.
