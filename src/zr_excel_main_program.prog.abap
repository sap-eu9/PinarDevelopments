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

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fname.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = syst-cprog
      dynpro_number = syst-dynnr
      field_name    = ' '
    IMPORTING
      file_name     = p_fname.


START-OF-SELECTION.

  " Step 1 : Upload Excel File
  PERFORM excel_upload.

  " Step 2: Insert Data into Candidate Table
  PERFORM insert_data_into_db.

END-OF-SELECTION.
