*&---------------------------------------------------------------------*
*& Project      : E-recruitement Project
*& Date         : 21.05.2024
*& Developer    : USER41 - Rizwan, Mohammad
*& Description  : Excel Data Migration
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

    LOOP AT lt_excel_raw_data ASSIGNING FIELD-SYMBOL(<fs_excel_raw_data>) GROUP BY <fs_excel_raw_data>-row ASCENDING.

      APPEND INITIAL LINE TO lt_candidate_data ASSIGNING FIELD-SYMBOL(<fs_cand_data>).

      LOOP AT GROUP <fs_excel_raw_data> ASSIGNING FIELD-SYMBOL(<fs_excel_group_data>).

        CASE <fs_excel_group_data>-col.
          WHEN 1.
            <fs_cand_data>-candidate_id    = <fs_excel_group_data>-value.
          WHEN 2.
            <fs_cand_data>-candidate_fname = <fs_excel_group_data>-value.
          WHEN 3.
            <fs_cand_data>-candidate_lname = <fs_excel_group_data>-value.
          WHEN 4.
            <fs_cand_data>-candidate_email = <fs_excel_group_data>-value.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.
    ENDLOOP.

    IF lt_candidate_data IS NOT INITIAL.
      MODIFY zrtcandidate FROM TABLE lt_candidate_data.
    ENDIF.

  ELSEIF r_obj2 IS NOT INITIAL.

  ELSEIF r_obj3 IS NOT INITIAL.

  ELSEIF r_obj4 IS NOT INITIAL.

  ENDIF.



ENDFORM.

FORM insert_data_into_db.

ENDFORM.
