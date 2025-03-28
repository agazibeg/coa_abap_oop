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

    "session #5
    DATA(lo_person_1) = NEW zcl_coa_4_person( is_person = VALUE zst_coa_person( firstname = |John|
                                                                                lastname = |Doe|
                                                                                dateofbirth = |19800101|
                                                                                job       = |Mechanic|
                                                                                address = VALUE zst_coa_address( city = |Kigali|
                                                                                                                 postalcode = 55555
                                                                                                                 country = |Rwanda| )
                                                                                )
                                            ).

    DATA(lo_person_2) = NEW zcl_coa_4_person( is_person = VALUE zst_coa_person( firstname = |Jane|
                                                                                lastname = |Doe|
                                                                                dateofbirth = |19850101|
                                                                                job       = |Teacher|
                                                                                address = VALUE zst_coa_address( city = |Kigali|
                                                                                                                 postalcode = 55555
                                                                                                                 country = |Rwanda| )
                                                                                )
                                            ).

*    out->write( lo_person_1->get_person(  ) ).
*    out->write( lo_person_2->get_person(  ) ).
*
*    "calling static method
*    DATA(lv_nr_persons) = zcl_coa_4_person=>get_nr_persons(  ).
*    out->write( lv_nr_persons ).

    loop at zcl_coa_4_person=>mt_persons into data(ls_person).
        out->write( ls_person-firstname ).
    endloop.

    "find one row
    read table zcl_coa_4_person=>mt_persons with key firstname = 'Jane' into ls_person.

    "take multiple results
    data lt_persons like zcl_coa_4_person=>mt_persons.

    loop at zcl_coa_4_person=>mt_persons into ls_person where address-city = 'Kigali' or firstname = 'John'.
        append ls_person to lt_persons.
    endloop.

    data lt_persons_sorted type sorted table of zst_coa_person with "unique key firstname
                                                               non-unique key address-city.

    lt_persons_sorted = zcl_coa_4_person=>mt_persons.

    lt_persons = filter #( lt_persons_sorted where address-city = conv #( 'Kigali' ) ).

    "end of session #5


*    "ToDo: check this!
**    out->write( 'Hello World!' )->write( 'Hello again!' ).
**
**    data(lv_result) = out->get( 'Hello from get' ).
**
**    out->write( |Write: { lv_result } | ).
*
*    DATA ls_person TYPE zst_coa_person.
*
**    ls_person-firstname = |John|.
**    ls_person-lastname = |Doe|.
**    ls_person-dateofbirth = |19800101|. "YYYYMMDD
**    ls_person-job = |Mechanic|.
**
**    ls_person-address-city = |Kigali|.
**    ls_person-address-postalcode = 55555.
**    ls_person-address-country = |Rwanda|.
*
*    "shorter syntax
*    ls_person = VALUE zst_coa_person( firstname = |John|
*                                      lastname = |Doe|
*                                      dateofbirth = |19800101|
*                                      job       = |Mechanic|
*                                      address = VALUE zst_coa_address( city = |Kigali|
*                                                                       postalcode = 55555
*                                                                       country = |Rwanda|
*                                                                     )
*                                     ).
*
**     out->write( ls_person ).
*
*    DATA(lo_person) = NEW zcl_coa_4_person( ).
*
*    "old syntax
**    data lo_person1 type ref to zcl_coa_4_person.
**    create object lo_person1.
*
*    lo_person->set_person( EXPORTING is_person = ls_person ).
*
*    "lo_person->get_person( RECEIVING rs_person = DATA(ls_person2) ).
*    "data(ls_person2) = lo_person->get_person( ).
*
*    lo_person->get_full_name( IMPORTING ev_full_name = data(lv_full_name) ).
*    out->write( lv_full_name ).
*
*    "RETURNING -> RECEIVING
*    "IMPORTING -> EXPORTING
*    "EXPORTING -> IMPORTING
*    "CHANGING -> CHANGING
*
*    data(lv_full_name_1) = |This is my full name|.
*    lo_person->add_full_name(  CHANGING cv_full_name = lv_full_name_1 ).
*
*    out->write( lv_full_name_1 ).

  ENDMETHOD.
ENDCLASS.
