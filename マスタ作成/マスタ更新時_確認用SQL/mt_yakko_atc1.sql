select
  m.* 
from
  milscm2.mt_yakko_atc1 m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          yakko_bunrui1_code
          , sekoubi 
        from
          milscm2.mt_yakko_atc1 
        group by
          yakko_bunrui1_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.yakko_bunrui1_code = t.yakko_bunrui1_code 
      and m.sekoubi = t.sekoubi
  )
