*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZRTCANDIDATE....................................*
DATA:  BEGIN OF STATUS_ZRTCANDIDATE                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRTCANDIDATE                  .
CONTROLS: TCTRL_ZRTCANDIDATE
            TYPE TABLEVIEW USING SCREEN '9000'.
*.........table declarations:.................................*
TABLES: *ZRTCANDIDATE                  .
TABLES: ZRTCANDIDATE                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
