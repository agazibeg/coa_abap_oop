CLASS zcl_coa_4_oop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_coa_4_oop IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "ToDo: check this!
*    out->write( 'Hello World!' )->write( 'Hello again!' ).
*
*    data(lv_result) = out->get( 'Hello from get' ).
*
*    out->write( |Write: { lv_result } | ).

    DATA ls_person TYPE zst_coa_person.

*    ls_person-firstname = |John|.
*    ls_person-lastname = |Doe|.
*    ls_person-dateofbirth = |19800101|. "YYYYMMDD
*    ls_person-job = |Mechanic|.
*
*    ls_person-address-city = |Kigali|.
*    ls_person-address-postalcode = 55555.
*    ls_person-address-country = |Rwanda|.

    "shorter syntax
    ls_person = VALUE zst_coa_person( firstname = |John|
                                      lastname = |Doe|
                                      "dateofbirth = |19800101|
                                      job       = |Mechanic|
                                      address = VALUE zst_coa_address( city = |Kigali|
                                                                       "postalcode = 55555
                                                                       country = |Rwanda|
                                                                     )
                                     ).

    DATA(lo_person) = NEW zcl_coa_4_person( ).
    lo_person->set_person( EXPORTING is_person = ls_person ).

    "data(ls_person2) = lo_person->get_person( ).
    lo_person->get_person( RECEIVING rs_person = DATA(ls_person2) ).


  ENDMETHOD.
ENDCLASS.
