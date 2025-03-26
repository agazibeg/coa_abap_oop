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
                                      dateofbirth = |19800101|
                                      job       = |Mechanic|
                                      address = VALUE zst_coa_address( city = |Kigali|
                                                                       postalcode = 55555
                                                                       country = |Rwanda|
                                                                     )
                                     ).

*     out->write( ls_person ).

    DATA(lo_person) = NEW zcl_coa_4_person( ).

    "old syntax
*    data lo_person1 type ref to zcl_coa_4_person.
*    create object lo_person1.

    lo_person->set_person( EXPORTING is_person = ls_person ).

    "lo_person->get_person( RECEIVING rs_person = DATA(ls_person2) ).
    "data(ls_person2) = lo_person->get_person( ).

    lo_person->get_full_name( IMPORTING ev_full_name = data(lv_full_name) ).
    out->write( lv_full_name ).

    "RETURNING -> RECEIVING
    "IMPORTING -> EXPORTING
    "EXPORTING -> IMPORTING
    "CHANGING -> CHANGING

    data(lv_full_name_1) = |This is my full name|.
    lo_person->add_full_name(  CHANGING cv_full_name = lv_full_name_1 ).

    out->write( lv_full_name_1 ).

  ENDMETHOD.
ENDCLASS.
