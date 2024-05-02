-- 診療行為付加情報マスタ取込用
insert 
into milscm4.mt_shinryo_koi_fuka 
select
  koshin_kubun
  , master_type
  , shinryo_koi_code
  , case 
    when shinryo_koi_kanji_name_ketasu = '' 
      then 0 
    else trunc(cast(shinryo_koi_kanji_name_ketasu as numeric)) 
    end as shinryo_koi_kanji_name_ketasu
  , shinryo_koi_kanji_name
  , case 
    when shinryo_koi_kana_name_ketasu = '' 
      then 0 
    else trunc(cast(shinryo_koi_kana_name_ketasu as numeric)) 
    end as shinryo_koi_kana_name_ketasu
  , shinryo_koi_kana_name
  , data_standard_code
  , case 
    when data_standard_ketasu = '' 
      then 0 
    else trunc(cast(data_standard_ketasu as numeric)) 
    end as data_standard_ketasu
  , data_standard_name
  , case 
    when gen_tensu_shikibetsu = '' 
      then 0 
    else trunc(cast(gen_tensu_shikibetsu as numeric)) 
    end as gen_tensu_shikibetsu
  , case 
    when gen_tensu = '' 
      then 0 
    else cast(gen_tensu as numeric) 
    end as gen_tensu
  , nyugai_tekiyo_kubun
  , aged_tekiyo_kubun
  , tensuran_shikibetsu_nyuingai
  , hokatsu_kensa
  , reserve1
  , dpc_tekiyo_kubun
  , clinic_kubun
  , shujutsu_kasan_kubun
  , iryo_kansatsu_kubun
  , kango_kasan
  , masui_shujutsu_kubun
  , reserve2
  , shobyo_kanren_kubun
  , reserve3
  , case 
    when jitsu_days = '' 
      then 0 
    else trunc(cast(jitsu_days as numeric)) 
    end as jitsu_days
  , case 
    when days_times = '' 
      then 0 
    else trunc(cast(days_times as numeric)) 
    end as days_times
  , iyakuhin_kanren_kubun
  , kizami_keisan_shikibetsu
  , case 
    when kizami_low = '' 
      then 0 
    else trunc(cast(kizami_low as numeric)) 
    end as kizami_low
  , case 
    when kizami_up = '' 
      then 0 
    else trunc(cast(kizami_up as numeric)) 
    end as kizami_up
  , case 
    when kizami_value = '' 
      then 0 
    else trunc(cast(kizami_value as numeric)) 
    end as kizami_value
  , case 
    when kizami_tensu = '' 
      then 0 
    else cast(kizami_tensu as numeric) 
    end as kizami_tensu
  , up_low_error
  , case 
    when up_times = '' 
      then 0 
    else trunc(cast(up_times as numeric)) 
    end as up_times
  , up_times_error
  , chu_kasan_code
  , chu_kasan_no
  , tsusoku_age
  , low_age
  , up_age
  , time_kasan_kubun
  , tekigo_kubun
  , facility_kijun
  , nyuyoji_kasan_kubun
  , taijuji_kasan_kubun
  , nyuin_kihon_gensan_shikibetsu
  , donor_kubun
  , kensa_handan_kubun
  , kensa_handan_group_kubun
  , teigen_kubun
  , sekizui_kasan_kubun
  , keibu_kasan_kubun
  , hogoki_kasan_kubun
  , gairai_kasan_kubun
  , old_tensu_shikibetsu
  , case 
    when old_tensu = '' 
      then 0 
    else cast(old_tensu as numeric) 
    end as old_tensu
  , kanji_henko_kubun
  , kana_henko_kubun
  , kentai_comment
  , tsusoku_kasan_tensu
  , hokatsu_teigen_kubun
  , choonpa_naishikyo_kasan_kubun
  , reserve4
  , tensuran_shikibetsu_nyuin
  , fungoki_kasan_kubun
  , kokuji_shikibetsu_kubun1
  , kokuji_shikibetsu_kubun2
  , chiiki_kasan
  , bed_su_kubun
  , facility_kijun_code1
  , facility_kijun_code2
  , facility_kijun_code3
  , facility_kijun_code4
  , facility_kijun_code5
  , facility_kijun_code6
  , facility_kijun_code7
  , facility_kijun_code8
  , facility_kijun_code9
  , facility_kijun_code10
  , choonpa_sekkai_kasan_kubun
  , tanki_shujutsu
  , shika_tekiyo_kubun
  , code_table_alphabet
  , kokuji_kanren_no_alphabet
  , henko_ymd
  , haishi_ymd
  , kohyo_junjo_no
  , code_table_no_sho
  , code_table_no_bu
  , code_table_no_kubun
  , code_table_no_edaban
  , code_table_no_koban
  , kokuji_kanren_no_sho
  , kokuji_kanren_no_bu
  , kokuji_kanren_no_kubun
  , kokuji_kanren_no_edaban
  , kokuji_kanren_no_koban
  , age1_kasan_low
  , age1_kasan_up
  , age1_kasan_koi_code
  , age2_kasan_low
  , age2_kasan_up
  , age2_kasan_koi_code
  , age3_kasan_low
  , age3_kasan_up
  , age3_kasan_koi_code
  , age4_kasan_low
  , age4_kasan_up
  , age4_kasan_koi_code
  , ido_kanren
  , kihon_kanji_name
  , fukubiko_naishikyo_kasan
  , fukubiko_kotsunanbu_kasan
  , long_masui_kasan
  , tensu_kubun_no
  , monitoring_kasan
  , toketsu_hozon_kasan
  , akusei_shuyo_kasan
  , sogai_kotei_kasan
  , chouonpa_sessaku_kasan
  , sashin_jiheisa_kasan
  , gairai_kansen_taisaku_koujo_kubun
  , jibi_inko_nyuyoji_kasan
  , jibi_inko_shoni_koukin_tekisei_shiyou_shien_kasan
  , sekkaisou_kyokusho_inatsu_heisa_shochi_kasan
  , reserve5
  , reserve6
  , reserve7
  , reserve8
  , reserve9
  , reserve10
  , reserve11
  , reserve12
  , reserve13
  , reserve14
  , reserve15
  , reserve16
  , reserve17
  , reserve18
  , reserve19
  , reserve20
  , reserve21
  , reserve22
  , reserve23
  , reserve24
  , reserve25
  , reserve26
  , reserve27
  , update_ymd 
from
  milscm4.mt_shinryo_koi_fuka_temp;
