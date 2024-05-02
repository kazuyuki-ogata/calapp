with iyakuhin as ( 
    select
        count(*) as iyakuhin 
    from
        milscm2.mt_iyakuhin m 
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
                        milscm2.mt_iyakuhin 
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
) 
, iyakuhin_brand as ( 
    select
        count(*) as iyakuhin_brand 
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
) 
, iyakuhin_ippan_name as ( 
    select
        count(*) as iyakuhin_ippan_name 
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
) 
, iyakuhin_sales_kaisha as ( 
    select
        count(*) as iyakuhin_sales_kaisha 
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
) 
, maker as ( 
    select
        count(*) as maker 
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
) 
, price as ( 
    select
        count(*) as price 
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
) 
, shippei as ( 
    select
        count(*) as shippei 
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
) 
, tokutei_kizai as ( 
    select
        count(*) as tokutei_kizai 
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
) 
, yakko_atc1 as ( 
    select
        count(*) as yakko_atc1 
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
) 
, yakko_atc2 as ( 
    select
        count(*) as yakko_atc2 
    from
        milscm2.mt_yakko_atc2 m 
    where
        exists ( 
            select
                1 
            from
                ( 
                    select
                        yakko_bunrui1_code
                        , yakko_bunrui2_code
                        , sekoubi 
                    from
                        milscm2.mt_yakko_atc2 
                    group by
                        yakko_bunrui1_code
                        , yakko_bunrui2_code
                        , sekoubi 
                    having
                        count(*) > 1
                ) t 
            where
                m.yakko_bunrui1_code = t.yakko_bunrui1_code 
                and m.yakko_bunrui2_code = t.yakko_bunrui2_code 
                and m.sekoubi = t.sekoubi
        )
) 
, yakko_atc3 as ( 
    select
        count(*) as yakko_atc3 
    from
        milscm2.mt_yakko_atc3 m 
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
                        , sekoubi 
                    from
                        milscm2.mt_yakko_atc3 
                    group by
                        yakko_bunrui1_code
                        , yakko_bunrui2_code
                        , yakko_bunrui3_code
                        , sekoubi 
                    having
                        count(*) > 1
                ) t 
            where
                m.yakko_bunrui1_code = t.yakko_bunrui1_code 
                and m.yakko_bunrui2_code = t.yakko_bunrui2_code 
                and m.yakko_bunrui3_code = t.yakko_bunrui3_code 
                and m.sekoubi = t.sekoubi
        )
) 
, yakko_atc4 as ( 
    select
        count(*) as yakko_atc4 
    from
        milscm2.mt_yakko_atc4 m 
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
                        , sekoubi 
                    from
                        milscm2.mt_yakko_atc4 
                    group by
                        yakko_bunrui1_code
                        , yakko_bunrui2_code
                        , yakko_bunrui3_code
                        , yakko_bunrui4_code
                        , sekoubi 
                    having
                        count(*) > 1
                ) t 
            where
                m.yakko_bunrui1_code = t.yakko_bunrui1_code 
                and m.yakko_bunrui2_code = t.yakko_bunrui2_code 
                and m.yakko_bunrui3_code = t.yakko_bunrui3_code 
                and m.yakko_bunrui4_code = t.yakko_bunrui4_code 
                and m.sekoubi = t.sekoubi
        )
) 
, yakko_atc5 as ( 
    select
        count(*) as yakko_atc5 
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
) 
select
    (select * from iyakuhin)
    , (select * from iyakuhin_brand)
    , (select * from iyakuhin_ippan_name)
    , (select * from iyakuhin_sales_kaisha)
    , (select * from maker)
    , (select * from price)
    , (select * from shippei)
    , (select * from tokutei_kizai)
    , (select * from yakko_atc1)
    , (select * from yakko_atc2)
    , (select * from yakko_atc3)
    , (select * from yakko_atc4)
    , (select * from yakko_atc5)
