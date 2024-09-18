*----------------------------------------------------------------------*
***INCLUDE LZRTCANDIDACYF01.
*----------------------------------------------------------------------*

FORM check_deletion_reason.

  IF zrtcandidacy-candidacy_status EQ 'A' AND zrtcandidacy-candidacy_reason IS NOT INITIAL.

    MESSAGE e001(zrt_msg). "Deletion reason can't be maintained, Please correct your entry

  ENDIF.

ENDFORM.
