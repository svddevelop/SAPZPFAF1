CLASS lsc_zr_tbl_2street DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_tbl_2street IMPLEMENTATION.

  METHOD adjust_numbers.
    CHECK lines(  mapped-zrtbl2street ) > 0.
    LOOP AT mapped-zrtbl2street ASSIGNING FIELD-SYMBOL(<fs_stree>).


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

      TYPES ty_street_id TYPE n LENGTH 6.
      TRY.
          cl_numberrange_runtime=>number_get(
                  EXPORTING
                      nr_range_nr = '01'
                      object =  'ZNUM_ADDR'
                  IMPORTING
                     number = DATA(lv_street_id)
                                              ).

          lv_max = CONV ty_street_id( lv_street_id ).

        CATCH cx_root.
      ENDTRY.
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      <fs_stree>-StreetID = lv_max.
      "<<fs_stree>>-StreetID = <<fs_stree>>-%tmp-StreetID.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS LHC_ZR_TBL_2STREET DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrTbl2street
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_TBL_2STREET IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
ENDCLASS.
