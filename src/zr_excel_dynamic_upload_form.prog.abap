*&---------------------------------------------------------------------*
*& Project      : E-recruitement Project
*& Date         : 08.06.2024
*& Developer    : USER41 - Rizwan, Mohammad
*& Description  : Dynamic Excel Data Migration
*&---------------------------------------------------------------------*
*& Modification log ~ Should be completed in reverse date order
*&~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*
*&   ID          | Date       | Name              | Description
*&~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*
*&  XXXXXXXX     | DD-MM-YYYY | XXXXXXXXXXXXX     |
*&                                                |
*&---------------------------------------------------------------------*

FORM excel_upload.

  DATA : lt_excel_raw_data TYPE issr_alsmex_tabline.

  DATA : lo_cand_struct TYPE REF TO data,
         lo_cand_table  TYPE REF TO data.

  FIELD-SYMBOLS : <fs_cand_struct> TYPE any,
                  <fs_cand_table>  TYPE STANDARD TABLE.


  CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    EXPORTING
      filename                = p_fname
      i_begin_col             = 1
      i_begin_row             = 2
      i_end_col               = 4
      i_end_row               = 10
    TABLES
      intern                  = lt_excel_raw_data
    EXCEPTIONS
      inconsistent_parameters = 1
      upload_ole              = 2
      OTHERS                  = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  IF r_obj1 IS NOT INITIAL.

*    cl_abap_structdescr=>describe_by_name( EXPORTING p_name      = p_name
*                                           RECEIVING p_descr_ref = go_structdescr ).

*****Type casting
*****
*****parent (car)
*****  |
*****Child  (VW Polo)

    go_structdescr ?= cl_abap_structdescr=>describe_by_name( EXPORTING p_name = 'ZRTCANDIDATE' ).
    go_tabledescr  ?= cl_abap_tabledescr=>create( p_line_type = go_structdescr ).

    CREATE DATA lo_cand_struct TYPE HANDLE go_structdescr.
    CREATE DATA lo_cand_table  TYPE HANDLE go_tabledescr.

    ASSIGN lo_cand_struct->* TO <fs_cand_struct>.
    ASSIGN lo_cand_table->*  TO <fs_cand_table>.


    LOOP AT lt_excel_raw_data ASSIGNING FIELD-SYMBOL(<fs_excel_raw_data>) GROUP BY <fs_excel_raw_data>-row ASCENDING.

      APPEND INITIAL LINE TO <fs_cand_table> ASSIGNING <fs_cand_struct>.

      LOOP AT GROUP <fs_excel_raw_data> ASSIGNING FIELD-SYMBOL(<fs_excel_group_data>).


      ENDLOOP.
    ENDLOOP.

    IF <fs_cand_table> IS NOT INITIAL.
      MODIFY zrtcandidate FROM TABLE <fs_cand_table>.
    ENDIF.

  ELSEIF r_obj2 IS NOT INITIAL.

    go_structdescr ?= cl_abap_structdescr=>describe_by_name( EXPORTING p_name = 'ZRTCANDIDACY' ).
    go_tabledescr  ?= cl_abap_tabledescr=>create( p_line_type = go_structdescr ).

    CREATE DATA lo_cand_struct TYPE HANDLE go_structdescr.
    CREATE DATA lo_cand_table  TYPE HANDLE go_tabledescr.

    ASSIGN lo_cand_struct->* TO <fs_cand_struct>.
    ASSIGN lo_cand_table->*  TO <fs_cand_table>.

  ELSEIF r_obj3 IS NOT INITIAL.

    go_structdescr ?= cl_abap_structdescr=>describe_by_name( EXPORTING p_name = 'ZRTAPPLICATION' ).
    go_tabledescr  ?= cl_abap_tabledescr=>describe_by_object_ref( p_object_ref = go_structdescr ).

    CREATE DATA lo_cand_struct TYPE HANDLE go_structdescr.
    CREATE DATA lo_cand_table  TYPE HANDLE go_tabledescr.

    ASSIGN lo_cand_struct->* TO <fs_cand_struct>.
    ASSIGN lo_cand_table->*  TO <fs_cand_table>.

  ELSEIF r_obj4 IS NOT INITIAL.

    go_structdescr ?= cl_abap_structdescr=>describe_by_name( EXPORTING p_name = 'ZRTJOBPOSTING' ).
    go_tabledescr  ?= cl_abap_tabledescr=>describe_by_object_ref( p_object_ref = go_structdescr ).

    CREATE DATA lo_cand_struct TYPE HANDLE go_structdescr.
    CREATE DATA lo_cand_table  TYPE HANDLE go_tabledescr.

    ASSIGN lo_cand_struct->* TO <fs_cand_struct>.
    ASSIGN lo_cand_table->*  TO <fs_cand_table>.

  ENDIF.



ENDFORM.

FORM insert_data_into_db.

ENDFORM.
