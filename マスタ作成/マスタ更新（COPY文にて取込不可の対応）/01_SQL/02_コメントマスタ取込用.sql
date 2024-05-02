-- コメントマスタ取込用
insert
into milscm4.mt_comment
select
  henkou_kubun
  , master_type
  , comment_cd
  , comment_cd_pattern
  , comment_cd_seq
  , case 
    when comment_sentence_kanji_ketasu = '' 
      then 0 
    else trunc(cast(comment_sentence_kanji_ketasu as numeric)) 
    end as comment_sentence_kanji_ketasu
  , comment_sentence_kanji_name
  , case 
    when comment_sentence_kana_ketasu = '' 
      then 0 
    else trunc(cast(comment_sentence_kana_ketasu as numeric)) 
    end as comment_sentence_kana_ketasu
  , comment_sentence_kana_name
  , case 
    when recept_hensyu_info1_column_position = '' 
      then 0 
    else trunc( 
      cast(recept_hensyu_info1_column_position as numeric)
    ) 
    end as recept_hensyu_info1_column_position
  , case 
    when recept_hensyu_info1_ketasu = '' 
      then 0 
    else trunc(cast(recept_hensyu_info1_ketasu as numeric)) 
    end as recept_hensyu_info1_ketasu
  , case 
    when recept_hensyu_info2_column_position = '' 
      then 0 
    else trunc( 
      cast(recept_hensyu_info2_column_position as numeric)
    ) 
    end as recept_hensyu_info2_column_position
  , case 
    when recept_hensyu_info2_ketasu = '' 
      then 0 
    else trunc(cast(recept_hensyu_info2_ketasu as numeric)) 
    end as recept_hensyu_info2_ketasu
  , case 
    when recept_hensyu_info3_column_position = '' 
      then 0 
    else trunc( 
      cast(recept_hensyu_info3_column_position as numeric)
    ) 
    end as recept_hensyu_info3_column_position
  , case 
    when recept_hensyu_info3_ketasu = '' 
      then 0 
    else trunc(cast(recept_hensyu_info3_ketasu as numeric)) 
    end as recept_hensyu_info3_ketasu
  , case 
    when recept_hensyu_info4_column_position = '' 
      then 0 
    else trunc( 
      cast(recept_hensyu_info4_column_position as numeric)
    ) 
    end as recept_hensyu_info4_column_position
  , case 
    when recept_hensyu_info4_ketasu = '' 
      then 0 
    else trunc(cast(recept_hensyu_info4_ketasu as numeric)) 
    end as recept_hensyu_info4_ketasu
  , reserve1
  , reserve2
  , case 
    when selective_comment_identification = '' 
      then 0 
    else trunc( 
      cast(selective_comment_identification as numeric)
    ) 
    end as selective_comment_identification
  , henko_ymd
  , haishi_ymd
  , comment_code
  , kouhyoujunjo_no
  , reserve3
  , reserve4
  , reserve5
  , reserve6
  , reserve7
  , reserve8
  , update_ymd 
from
  milscm4.mt_comment_temp;
