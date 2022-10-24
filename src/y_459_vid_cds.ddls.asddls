@AbapCatalog.sqlViewName: 'Y459_VIEW_VID'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS del video SCP'
define view Y_459_VID_CDS
  as select from y459_log
{

  key change_id          as id,
      travel_id          as travel,
      changing_operation as operation,
      changed_field_name as change,
      changed_value      as value,
      case
      when created_at is not initial
      //  then dats_days_between( $session.system_date, created_at ) Se pueden usar funciones.
      then dats_days_between( end_at, created_at )
      end                as dias
}
