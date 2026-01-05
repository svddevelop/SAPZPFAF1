@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CiTY View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDD_CITY 
as select from ztbl_address
{
   key id                      as city_id,
      addr                    as city,
      ae_type,

      // Дополнительные системные поля, если они есть в таблице
      parent as country_id
}
where
  ae_type = 'C'
