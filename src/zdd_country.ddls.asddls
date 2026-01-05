@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZDD_COUNTRY
  as select from ztbl_address
{

  key id                      as country_id,
      addr                    as country,
      ae_type
}
where
  ae_type = 'L'
