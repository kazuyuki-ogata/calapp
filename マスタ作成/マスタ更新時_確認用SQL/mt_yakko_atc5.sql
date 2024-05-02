select
  m.* 
from
  milscm2.mt_yakko_atc5 m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          yakko_bunrui1_code
          , yakko_bunrui2_code
          , yakko_bunrui3_code
          , yakko_bunrui4_code
          , yakko_bunrui5_code
          , sekoubi 
        from
          milscm2.mt_yakko_atc5 
        group by
          yakko_bunrui1_code
          , yakko_bunrui2_code
          , yakko_bunrui3_code
          , yakko_bunrui4_code
          , yakko_bunrui5_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.yakko_bunrui1_code = t.yakko_bunrui1_code 
      and m.yakko_bunrui2_code = t.yakko_bunrui2_code 
      and m.yakko_bunrui3_code = t.yakko_bunrui3_code 
      and m.yakko_bunrui4_code = t.yakko_bunrui4_code 
      and m.yakko_bunrui5_code = t.yakko_bunrui5_code 
      and m.sekoubi = t.sekoubi
  )
