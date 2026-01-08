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


    DATA: lt_address TYPE TABLE OF ztbl_address.

    out->write( zcl_util=>nr_addr_next(  ) ).
    out->write( zcl_util=>nr_addr_next(  ) ).


*  lt_address = VALUE #(
*  (
*  client =  sy-mandt
*  id = ZCL_UTIL=>nr_addr_next(  )
*  parent = 0
*  addr = 'GERMANY'
*  ae_type = 'L'
*  )
*  (
*  client = sy-mandt
*  id = ZCL_UTIL=>nr_addr_next(  )
*  parent = 1
*  addr = 'BERLIN'
*  ae_type = 'C'
*  )
*
*  (
*  client = sy-mandt
*  id = ZCL_UTIL=>nr_addr_next(  )
*  parent = 2
*  addr = 'LINDENSTR'
*  ae_type = 'S'
*  )
*  ).

    lt_address = VALUE #(
    (
    client = sy-mandt
    id = zcl_util=>nr_addr_next(  )
    parent = 2
    addr = 'KURFÜSTERDAMM'
    ae_type = 'S'
    )
    (
    client = sy-mandt
    id = zcl_util=>nr_addr_next(  )
    parent = 2
    addr = 'Tiergarten'
    ae_type = 'S'
    )
    (
    client = sy-mandt
    id = zcl_util=>nr_addr_next(  )
    parent = 2
    addr = 'Abrakadabra'
    ae_type = 'S'
    )
    ).

*    LOOP AT lt_address ASSIGNING FIELD-SYMBOL(<ls_address>).
*
*
*    ENDLOOP.

    out->write( lt_address ).
    INSERT ztbl_address FROM TABLE @lt_address
    ACCEPTING DUPLICATE KEYS.

    DELETE FROM ztbl_address WHERE id = 0.

    out->write( 'end' ).



  ENDMETHOD.

  METHOD maintenance.

    DELETE FROM ztbl_address WHERE id >= 21.
    out->write( 'maintenance end' ).

  ENDMETHOD.

ENDCLASS.
