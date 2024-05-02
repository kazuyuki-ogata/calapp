select
  m.* 
from
  milscm2.mt_tokutei_kizai m 
where
  exists ( 
    select
      1 
    from
      ( 
        select
          tokutei_kizai_cd
          , sekoubi 
        from
          milscm2.mt_tokutei_kizai 
        group by
          tokutei_kizai_cd
          , sekoubi 
        having
          count(*) > 1
      ) t 
    where
      m.tokutei_kizai_cd = t.tokutei_kizai_cd 
      and m.sekoubi = t.sekoubi
  )
