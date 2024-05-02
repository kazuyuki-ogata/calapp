-- 成分量マスタ取込用
insert 
into milscm4.mt_seibunryo 
select
  yj_code
  , haigozai_f
  , seibun_group_code
  , seibun_code
  , case 
    when seibunryo = '' 
      then 0 
    else cast(seibunryo as numeric) 
    end as seibunryo
  , seibun_unit_code
  , case 
    when kokuji_kikakuryo = '' 
      then 0 
    else cast(kokuji_kikakuryo as numeric) 
    end as kokuji_kikakuryo
  , kokuji_kikaku_unit_code
  , bikou
  , koshin_kubun
  , update_ymd 
from
  milscm4.mt_seibunryo_temp;
