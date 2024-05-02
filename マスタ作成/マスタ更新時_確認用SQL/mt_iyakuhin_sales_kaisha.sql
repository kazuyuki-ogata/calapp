select
  m.* 
from
  milscm2.mt_iyakuhin_sales_kaisha m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          iyakuhin_code
          , maker_code
          , sekoubi 
        from
          milscm2.mt_iyakuhin_sales_kaisha 
        group by
          iyakuhin_code
          , maker_code
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.iyakuhin_code = t.iyakuhin_code 
      and m.maker_code = t.maker_code 
      and m.sekoubi = t.sekoubi
  )
