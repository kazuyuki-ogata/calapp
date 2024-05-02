select
  m.* 
from
  milscm2.mt_shippei m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          shippei_code
          , sekoubi 
        from
          milscm2.mt_shippei 
        group by
          shippei_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.shippei_code = t.shippei_code 
      and m.sekoubi = t.sekoubi
  )
