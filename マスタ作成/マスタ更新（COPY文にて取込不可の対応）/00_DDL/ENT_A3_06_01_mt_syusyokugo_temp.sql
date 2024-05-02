-- DROP TABLE milscm4.mt_syusyokugo_temp;
CREATE TABLE milscm4.mt_syusyokugo_temp( 
  henkou_kubun TEXT NOT NULL                    -- 変更区分
  , master_type TEXT                            -- マスター種別
  , syusyokugo_cd TEXT NOT NULL                 -- 修飾語コード
  , reserve1 TEXT                               -- 予備1
  , reserve2 TEXT                               -- 予備2
  , syusyokugo_name_ketasu TEXT                 -- 修飾語名称桁数
  , syusyokugo_name TEXT                        -- 修飾語名称
  , reserve3 TEXT                               -- 予備3
  , syusyokugo_kana_name_ketasu TEXT            -- 修飾語カナ名称桁数
  , syusyokugo_kana_name TEXT                   -- 修飾語カナ名称
  , reserve4 TEXT                               -- 予備4
  , syusyokugo_name_henkou TEXT                 -- 修飾語名称（変更情報）
  , syusyokugo_kana_name_henkou TEXT            -- 修飾語カナ名称（変更情報）
  , syusai_ymd TEXT                             -- 収載年月日
  , henko_ymd TEXT                              -- 変更年月日
  , haishi_ymd TEXT                             -- 廃止年月日
  , syusyokugo_kanri_no TEXT                    -- 修飾語管理番号
  , syusyokugo_koukan_cd TEXT                   -- 修飾語交換用コード
  , syusyokugo_kubun TEXT                       -- 修飾語区分
  , update_ymd TEXT NOT NULL                    -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_syusyokugo_temp ADD CONSTRAINT mt_syusyokugo_temp_pkey PRIMARY KEY (henkou_kubun, syusyokugo_cd, update_ymd)
; 

ALTER TABLE milscm4.mt_syusyokugo_temp OWNER TO pgmisgrp1; 

GRANT ALL 
  ON TABLE milscm4.mt_syusyokugo_temp TO pgappl11;
