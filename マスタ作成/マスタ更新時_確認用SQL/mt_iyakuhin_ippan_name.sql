select
  m.* 
from
  milscm2.mt_iyakuhin_ippan_name m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          iyakuhin_ippan_name_code
          , sekoubi 
        from
          milscm2.mt_iyakuhin_ippan_name 
        group by
          iyakuhin_ippan_name_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.iyakuhin_ippan_name_code = t.iyakuhin_ippan_name_code 
      and m.sekoubi = t.sekoubi
  )
