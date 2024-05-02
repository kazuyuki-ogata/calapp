select
  m.* 
from
  milscm2.mt_price m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          iyakuhin_code
          , sekoubi 
        from
          milscm2.mt_price 
        group by
          iyakuhin_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.iyakuhin_code = t.iyakuhin_code 
      and m.sekoubi = t.sekoubi
  )
