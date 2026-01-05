@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STREET View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDD_STREET as select from ztbl_address
{
   key id                      as street_id,
      addr                    as street,
      ae_type,

      // Дополнительные системные поля, если они есть в таблице
      parent as city_id
}
where
  ae_type = 'S'
