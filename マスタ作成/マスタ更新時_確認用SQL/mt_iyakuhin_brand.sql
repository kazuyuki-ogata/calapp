select
  m.* 
from
  milscm2.mt_iyakuhin_brand m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          iyakuhin_brand_code
          , sekoubi 
        from
          milscm2.mt_iyakuhin_brand 
        group by
          iyakuhin_brand_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.iyakuhin_brand_code = t.iyakuhin_brand_code 
      and m.sekoubi = t.sekoubi
  )
