*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZRTCANDIDACY....................................*
DATA:  BEGIN OF STATUS_ZRTCANDIDACY                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRTCANDIDACY                  .
CONTROLS: TCTRL_ZRTCANDIDACY
            TYPE TABLEVIEW USING SCREEN '9000'.
*.........table declarations:.................................*
TABLES: *ZRTCANDIDACY                  .
TABLES: ZRTCANDIDACY                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
