CLASS zcl_rap2_test1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS test_numgen
      IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

    CLASS-METHODS init_numrange
      IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

    CLASS-METHODS delete_from_draft
      IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap2_test1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "test_numgen( out ).
    "init_numrange( out ).
    delete_from_draft( out ).

  ENDMETHOD.

  METHOD test_numgen.
    DATA lv_idx TYPE i.
    DATA lv_num TYPE n LENGTH 16.
    DATA lv_max TYPE n LENGTH 16.
*      SELECT FROM zcs03_custorders FIELDS MAX( orderid ) INTO @DATA(lv_max).
*      lv_idx = sy-tabix.
*      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*      TRY.
*          lv_num = lv_max.
*          IF lv_num < 100000.
*            lv_num += 100000.
*          ENDIF.
*        CATCH cx_root.
*          lv_num = 100000.
*      ENDTRY.
*      lv_max = lv_num + 1 + lv_idx.

    TYPES ty_city_id TYPE n LENGTH 6.
    TRY.
        cl_numberrange_runtime=>number_get(
                EXPORTING
                    nr_range_nr = '01'
                    object =  'ZNUM_ADDR'
                IMPORTING
                   number = DATA(lv_city_id)
                                            ).

        lv_max = CONV ty_city_id( lv_city_id ).

      CATCH cx_root.
        out->write( 'except' ).
    ENDTRY.
    out->write( |'lv_max = { lv_max }'| ).

  ENDMETHOD.

  METHOD init_numrange.

    TRY.
        cl_numberrange_intervals=>create(
          EXPORTING
          interval = VALUE #( ( nrrangenr = '01' fromnumber = '1' tonumber = '999999' ) )
          object = 'ZNUM_ADDR'
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

  METHOD delete_from_draft.

    DELETE FROM ztbl_2city_d.
    out->write( 'ztbl_2city_d' ).

  ENDMETHOD.

ENDCLASS.
