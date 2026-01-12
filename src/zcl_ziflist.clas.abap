CLASS zcl_ziflist DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


    INTERFACES zif_sum.
    INTERFACES zif_mul.


  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-METHODS fill_new_data_into_table
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS zcl_ziflist IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    fill_new_data_into_table( out ).

  ENDMETHOD.


  METHOD fill_new_data_into_table.

    DELETE FROM ztbl_ziflist.

    DATA lt_ziflist TYPE TABLE OF ztbl_ziflist.

    lt_ziflist = VALUE #(
    ( interfacename = 'ZIF_SUM' calc_value = '123.123' )
      ( interfacename = 'zif_mul' calc_value = '321.321' )
    ).

    INSERT ztbl_ziflist FROM TABLE @lt_ziflist.

    out->write( 'ready!' ).

  ENDMETHOD.

  METHOD zif_sum~calc_value.

    rv_value = iv_value + iv_value.

  ENDMETHOD.

  METHOD zif_mul~calc_value.

    rv_value = iv_value * iv_value.

  ENDMETHOD.

ENDCLASS.
