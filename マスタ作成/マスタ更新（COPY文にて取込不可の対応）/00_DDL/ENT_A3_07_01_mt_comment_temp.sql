-- DROP TABLE milscm4.mt_comment_temp;
CREATE TABLE milscm4.mt_comment_temp(
    henkou_kubun TEXT NOT NULL                  -- 変更区分
    , master_type TEXT NOT NULL                 -- マスター種別
    , comment_cd TEXT NOT NULL                  -- コメントコード区分
    , comment_cd_pattern TEXT NOT NULL          -- コメントコードパターン
    , comment_cd_seq TEXT NOT NULL              -- コメントコード一連番号
    , comment_sentence_kanji_ketasu TEXT        -- コメント文漢字有効桁数
    , comment_sentence_kanji_name TEXT          -- コメント文漢字名称
    , comment_sentence_kana_ketasu TEXT         -- コメント文カナ有効桁数
    , comment_sentence_kana_name TEXT           -- コメント文カナ名称
    , recept_hensyu_info1_column_position TEXT  -- レセプト編集情報1カラム位置
    , recept_hensyu_info1_ketasu TEXT           -- レセプト編集情報1桁数
    , recept_hensyu_info2_column_position TEXT  -- レセプト編集情報2カラム位置
    , recept_hensyu_info2_ketasu TEXT           -- レセプト編集情報2桁数
    , recept_hensyu_info3_column_position TEXT  -- レセプト編集情報3カラム位置
    , recept_hensyu_info3_ketasu TEXT           -- レセプト編集情報3桁数
    , recept_hensyu_info4_column_position TEXT  -- レセプト編集情報4カラム位置
    , recept_hensyu_info4_ketasu TEXT           -- レセプト編集情報4桁数
    , reserve1 TEXT                             -- 予備1
    , reserve2 TEXT                             -- 予備2
    , selective_comment_identification TEXT     -- 選択式コメント識別
    , henko_ymd TEXT                            -- 変更年月日
    , haishi_ymd TEXT                           -- 廃止年月日
    , comment_code TEXT                         -- コメントコード
    , kouhyoujunjo_no TEXT                      -- 公表順序番号
    , reserve3 TEXT                             -- 予備3
    , reserve4 TEXT                             -- 予備4
    , reserve5 TEXT                             -- 予備5
    , reserve6 TEXT                             -- 予備6
    , reserve7 TEXT                             -- 予備7
    , reserve8 TEXT                             -- 予備8
    , update_ymd TEXT NOT NULL                  -- データ登録日
);

ALTER TABLE ONLY milscm4.mt_comment_temp ADD CONSTRAINT mt_comment_temp_pkey PRIMARY KEY (
  henkou_kubun
  , comment_cd
  , comment_cd_pattern
  , comment_cd_seq
  , update_ymd
);

ALTER TABLE milscm4.mt_comment_temp OWNER TO pgmisgrp1;
