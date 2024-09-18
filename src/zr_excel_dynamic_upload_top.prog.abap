*&---------------------------------------------------------------------*
*& Include ZR_EXCEL_DYNAMIC_UPLOAD_TOP              - Report ZR_EXCEL_DYNAMIC_UPLOAD
*&---------------------------------------------------------------------*
REPORT zr_excel_dynamic_upload.

DATA : go_structdescr TYPE REF TO cl_abap_structdescr,
       go_tabledescr  TYPE REF TO cl_abap_tabledescr.


SELECTION-SCREEN : BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS : p_fname TYPE localfile.
  SELECTION-SCREEN : SKIP.

  PARAMETERS : r_obj1 RADIOBUTTON GROUP rb1 DEFAULT 'X',
               r_obj2 RADIOBUTTON GROUP rb1,
               r_obj3 RADIOBUTTON GROUP rb1,
               r_obj4 RADIOBUTTON GROUP rb1.

SELECTION-SCREEN : END OF BLOCK b1.
