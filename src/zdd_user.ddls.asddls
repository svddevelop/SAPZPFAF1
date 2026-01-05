@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'USER'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDD_USER as select from ztbl_users
{

    id,
    email,
    lang
    
    
}
