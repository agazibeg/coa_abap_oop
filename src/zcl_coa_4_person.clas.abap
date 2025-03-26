CLASS zcl_coa_4_person DEFINITION
  PUBLIC
  "FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_person RETURNING VALUE(rs_person) TYPE zst_coa_person.

    METHODS set_person IMPORTING is_person TYPE zst_coa_person.

    METHODS set_basic_person_attributes IMPORTING iv_firstname   TYPE string
                                                  iv_lastname    TYPE string
                                                  iv_dateofbirth TYPE dats.

    METHODS set_address IMPORTING iv_country    TYPE string
                                  iv_city       TYPE string
                                  iv_postalcode TYPE i.

    METHODS set_job IMPORTING iv_job TYPE string.

    METHODS get_full_name EXPORTING ev_full_name type string.

    methods add_full_name changing cv_full_name type string.

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

  METHOD set_basic_person_attributes.

    ms_person-firstname = iv_firstname.
    ms_person-lastname  = iv_lastname.
    ms_person-dateofbirth = iv_dateofbirth.

  ENDMETHOD.

  METHOD set_address.
    ms_person-address-city = iv_city.
    ms_person-address-country = iv_country.
    ms_person-address-postalcode = iv_postalcode.
  ENDMETHOD.

  METHOD set_job.
    ms_person-job = iv_job.

    "iv_job = 'Job'.
  ENDMETHOD.

  METHOD get_full_name.
    ev_full_name = |{ ms_person-firstname } { ms_person-lastname }|.
  ENDMETHOD.

  METHOD add_full_name.
    cv_full_name = |{ cv_full_name }: { ms_person-firstname } { ms_person-lastname }|.
  ENDMETHOD.

ENDCLASS.
