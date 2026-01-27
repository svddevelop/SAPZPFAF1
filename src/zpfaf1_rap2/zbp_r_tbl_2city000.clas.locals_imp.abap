CLASS lsc_zr_tbl_2city000 DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_tbl_2city000 IMPLEMENTATION.

  METHOD adjust_numbers.

    CHECK lines(  mapped-zrtbl2city000 ) > 0.
    LOOP AT mapped-zrtbl2city000 ASSIGNING FIELD-SYMBOL(<fs_city>).


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
      ENDTRY.
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      <fs_city>-CityID = lv_max.
      "<fs_city>-CityID = <fs_city>-%tmp-CityID.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_tbl_2city000 DEFINITION INHERITING FROM cl_abap_behavior_handler.
PRIVATE SECTION.
  METHODS:
    get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING
      REQUEST requested_authorizations FOR ZrTbl2city000
      RESULT result.
ENDCLASS.

CLASS lhc_zr_tbl_2city000 IMPLEMENTATION.
METHOD get_global_authorizations.
ENDMETHOD.
ENDCLASS.
