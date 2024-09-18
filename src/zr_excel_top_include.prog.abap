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

DATA : lt_candidate_data   TYPE STANDARD TABLE OF zrtcandidate,
       lt_candidacy_data   TYPE STANDARD TABLE OF zrtcandidacy,
       lt_application_data TYPE STANDARD TABLE OF zrtapplication,
       lt_jobposting_data  TYPE STANDARD TABLE OF zrtjobposting.


SELECTION-SCREEN : BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS : p_fname TYPE localfile.
  SELECTION-SCREEN : SKIP.

  PARAMETERS : r_obj1 RADIOBUTTON GROUP rb1 DEFAULT 'X',
               r_obj2 RADIOBUTTON GROUP rb1,
               r_obj3 RADIOBUTTON GROUP rb1,
               r_obj4 RADIOBUTTON GROUP rb1.

SELECTION-SCREEN : END OF BLOCK b1.
