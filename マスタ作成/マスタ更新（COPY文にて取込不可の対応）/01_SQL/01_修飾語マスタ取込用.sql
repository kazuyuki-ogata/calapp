-- 修飾語マスタ取込用
insert 
into milscm4.mt_syusyokugo 
select
  henkou_kubun
  , master_type
  , syusyokugo_cd
  , reserve1
  , reserve2
  , case 
    when syusyokugo_name_ketasu = '' 
      then 0 
    else trunc(cast(syusyokugo_name_ketasu as numeric)) 
    end as syusyokugo_name_ketasu
  , syusyokugo_name
  , reserve3
  , case 
    when syusyokugo_kana_name_ketasu = '' 
      then 0 
    else trunc(cast(syusyokugo_kana_name_ketasu as numeric)) 
    end as syusyokugo_kana_name_ketasu
  , syusyokugo_kana_name
  , reserve4
  , syusyokugo_name_henkou
  , syusyokugo_kana_name_henkou
  , syusai_ymd
  , henko_ymd
  , haishi_ymd
  , case 
    when syusyokugo_kanri_no = '' 
      then 0 
    else trunc(cast(syusyokugo_kanri_no as numeric)) 
    end as syusyokugo_kanri_no
  , syusyokugo_koukan_cd
  , syusyokugo_kubun
  , update_ymd 
from
  milscm4.mt_syusyokugo_temp;
