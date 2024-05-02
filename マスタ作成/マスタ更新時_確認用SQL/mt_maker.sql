select
  m.* 
from
  milscm2.mt_maker m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          maker_code
          , sekoubi 
        from
          milscm2.mt_maker 
        group by
          maker_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.maker_code = t.maker_code 
      and m.sekoubi = t.sekoubi
  )
