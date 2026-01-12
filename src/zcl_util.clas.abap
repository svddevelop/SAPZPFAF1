CLASS zcl_util DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .



    CLASS-METHODS nr_addr_next
      RETURNING
        VALUE(rs_result) TYPE zde_bid.

    CLASS-METHODS    nr_addr_init
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out    .

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS:
        gc_number_range_object TYPE string VALUE 'ZNR_ADDR'.
ENDCLASS.



CLASS zcl_util IMPLEMENTATION.

  METHOD nr_addr_next.

    TYPES ty_customer_id TYPE n LENGTH 16.

    TRY.
        cl_numberrange_runtime=>number_get(
                EXPORTING

                nr_range_nr = '01'
                object =  'ZNR_ADDR'

                IMPORTING
                number = DATA(lv_customer_id)
                                            ).



        rs_result = CONV zde_bid( lv_customer_id ).

*        out->write( lv_custom_id ).


      CATCH cx_root.
    ENDTRY.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

*    nr_addr_init(  out ).
*    RETURN.

    " Neue Nummer

    TYPES ty_customer_id TYPE n LENGTH 16.

    TRY.
        cl_numberrange_runtime=>number_get(
                EXPORTING

                nr_range_nr = '01'
                object =  'ZNR_ADDR'

                IMPORTING
                number = DATA(lv_customer_id)
                                            ).

        DATA(lv_custom_id) = CONV ty_customer_id( lv_customer_id ).

        out->write( lv_custom_id ).


      CATCH cx_root.
        out->write( 'Exception' ).
    ENDTRY.




  ENDMETHOD.

  METHOD nr_addr_init.
    TRY.
        cl_numberrange_intervals=>create(
          EXPORTING
          interval = VALUE #( ( nrrangenr = '01' fromnumber = '1' tonumber = '999999' ) )
          object = 'ZNR_ADDR'
          IMPORTING
          error = DATA(error)
          error_inf = DATA(error_inf)
          error_iv = DATA(error_iv)
                      ).
      CATCH cx_root INTO DATA(lo_exc).
        out->write( lo_exc->get_text(  ) ).
    ENDTRY.

    RETURN.
  ENDMETHOD.

ENDCLASS.
