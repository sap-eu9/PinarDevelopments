*&---------------------------------------------------------------------*
*& Include          ZR_CRUD_WITH_BOPF_M01
*&---------------------------------------------------------------------*

START-OF-SELECTION.

  " 1. CTRL+Space after =>  will show all the methods/attributes
  " 2. Shift+ Enter will load the method definition
  " 3. Factory pattern - Used when complex object instantiation is required

  TRY.
      /bobf/cl_tra_serv_mgr_factory=>get_service_manager(
        EXPORTING
          iv_bo_key          = zr_job_posting_intf=>sc_bo_key          " Business Object
        RECEIVING
          eo_service_manager = DATA(lo_service_manager) " Interface for (Proxy) Service Manager
      ).
    CATCH /bobf/cx_frw_contrct_violation. " Caller violates a BOPF contract
  ENDTRY.

  DATA: ls_job_posting TYPE zrds_job_posting_root.

  ls_job_posting-jobposting_id     = '900000'.
  ls_job_posting-job_description   = 'SAP ABAP Programmer'.
  ls_job_posting-job_country       = 'DE'.
  ls_job_posting-job_city          = '11'.
  ls_job_posting-job_type          = '1'.
  ls_job_posting-job_contact_name  = 'Rizwan Mohammad'.
  ls_job_posting-job_contact_email = 'rizwan@gmail.com'.

  APPEND INITIAL LINE TO gt_modification ASSIGNING FIELD-SYMBOL(<fs_modification>).
  <fs_modification>-node         = zr_job_posting_intf=>sc_node-root.
  <fs_modification>-change_mode  = 'C'. " Create
  <fs_modification>-key          = cl_system_uuid=>create_uuid_x16_static( ).
  <fs_modification>-data         = REF #( ls_job_posting ).

  TRY.
      lo_service_manager->modify(
        EXPORTING
          it_modification = gt_modification " Create Operation
        IMPORTING
          eo_change       = DATA(eo_change)
          eo_message      = DATA(eo_message)     " In-Line declarations
      ).
    CATCH /bobf/cx_frw_contrct_violation. " Caller violates a BOPF contract
  ENDTRY.

  /bobf/cl_tra_trans_mgr_factory=>get_transaction_manager( )->save( ).

  SKIP.

  " Retrieve the created record
*  TRY.
*      lo_service_manager->retrieve(
*        EXPORTING
*          iv_node_key             = iv_node_key                        " Node
*          it_key                  = it_key                             " Key Table
*          iv_before_image         = abap_false                         " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
*          iv_edit_mode            = /bobf/if_conf_c=>sc_edit_read_only " Change Mode
*          iv_fill_data            = abap_true                          " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
*          iv_invalidate_cache     = abap_false                         " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
*          it_requested_attributes = it_requested_attributes            " List of Names (e.g. Fieldnames)
*        IMPORTING
*          eo_message              = eo_message                         " Interface of Message Object
*          eo_change               = eo_change                          " Interface of Change Object
*          et_data                 = et_data
*          et_failed_key           = et_failed_key                      " Key Table
*      ).
*    CATCH /bobf/cx_frw_contrct_violation. " Caller violates a BOPF contract
*  ENDTRY.
