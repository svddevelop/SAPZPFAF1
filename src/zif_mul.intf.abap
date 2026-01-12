INTERFACE zif_mul
  PUBLIC .

  METHODS calc_value
    IMPORTING
              iv_value        TYPE zde_dec16
    RETURNING VALUE(rv_value) TYPE zde_dec16.

ENDINTERFACE.
