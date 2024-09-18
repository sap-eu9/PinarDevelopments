
REPORT zr_oops_basics_01.


" Global Class - SE24
" Local Class - This will be accesible within the program

CLASS zcl_demo DEFINITION FINAL CREATE PRIVATE.

  " Create Public - Object creation is allowed
  " Create Private - Restrict calling programs to create instance

*    " 1. Create instance inside our class
*    " 2. Delegate this object creation to another class ex. Factory class

  PUBLIC SECTION.
    " Static & Instance

    CLASS-METHODS: get_instance EXPORTING eo_instance TYPE REF TO zcl_demo.
    " Add two numbers
    METHODS: add_two_numbers IMPORTING number1 TYPE i
                                       number2 TYPE i
                             EXPORTING result  TYPE i.


ENDCLASS.

CLASS zcl_demo IMPLEMENTATION.

  METHOD get_instance.

    eo_instance = NEW #( ).

  ENDMETHOD.

  METHOD add_two_numbers.

    result = number1 + number2.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA : lo_demo TYPE REF TO zcl_demo.

  "CREATE OBJECT lo_demo. " in case of CREATE PUBLIC
  zcl_demo=>get_instance( IMPORTING eo_instance = lo_demo ).

  lo_demo->add_two_numbers(
    EXPORTING
      number1 = 10
      number2 = 15
    IMPORTING
      result  = DATA(lv_result) ).


  WRITE : 'Result is : ', lv_result.
