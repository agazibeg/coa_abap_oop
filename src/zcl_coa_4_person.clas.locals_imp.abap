*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_person_helper DEFINITION
  CREATE PUBLIC .

  public section.

  class-methods get_full_name importing iv_firstname type string
                                        iv_lastname type string
                              returning value(rv_fullname) type string.

  methods get_some_string returning value(rv_string) type string.

ENDCLASS.

CLASS lcl_person_helper IMPLEMENTATION.

    method get_full_name.
        rv_fullname = |{ iv_firstname } { iv_lastname }|.
    endmethod.

    method get_some_string.
        rv_string = |Chernet asked a question|.
    endmethod.

ENDCLASS.
