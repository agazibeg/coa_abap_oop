CLASS zcl_coa_4_person DEFINITION
  PUBLIC
  "FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_person RETURNING VALUE(rs_person) TYPE zst_coa_person.
    METHODS set_person IMPORTING is_person TYPE zst_coa_person.

  PROTECTED SECTION.
*    DATA mv_firstname   TYPE string.
*    DATA mv_lastname    TYPE string.
*    DATA mv_dateofbirth TYPE dats.
*    DATA mv_job         TYPE string.
*    DATA mv_address     TYPE string.
    DATA ms_person TYPE zst_coa_person.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_coa_4_person IMPLEMENTATION.
  METHOD get_person.
    rs_person = ms_person.
  ENDMETHOD.

  METHOD set_person.
    ms_person = is_person.
  ENDMETHOD.

ENDCLASS.
