CREATE TABLE milscm4.mt_shisetsu_zokusei_act( 
    facility_id TEXT NOT NULL                   -- 施設ID
    , ippan_bed INTEGER default 0 NOT NULL      -- 一般病床
    , seishin_bed INTEGER default 0 NOT NULL    -- 精神病床
    , kansen_bed INTEGER default 0 NOT NULL     -- 感染症病床
    , kekkaku_bed INTEGER default 0 NOT NULL    -- 結核病床
    , ryouyou_bed INTEGER default 0 NOT NULL    -- 療養病床
    , univ_hp_f TEXT default '0' NOT NULL       -- 大学病院F
    , tokutei_hp_f TEXT default '0' NOT NULL    -- 特定機能病院F
    , cancer_hp_f INTEGER default 0 NOT NULL    -- がん拠点病院F
    , high_acute_care_hp_f TEXT default '0' NOT NULL -- 高度急性期病院F
    , acute_care_hp_f TEXT default '0' NOT NULL -- 急性期病院F
    , mil_exit_f TEXT default '0' NOT NULL      -- 千年カルテ離脱施設フラグ
    , torikomi_kijun_ym TEXT default '999999' NOT NULL -- 取込基準年月
    , update_ymd TEXT default '99999999' NOT NULL -- データ登録年月日
); 

ALTER TABLE ONLY milscm4.mt_shisetsu_zokusei_act ADD CONSTRAINT mt_shisetsu_zokusei_act_pkey PRIMARY
 KEY (facility_id, torikomi_kijun_ym); 

ALTER TABLE milscm4.mt_shisetsu_zokusei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_shisetsu_zokusei_act TO pgappl11; 

CREATE TABLE milscm4.mt_iryouken2_act( 
    iryouken2_cd TEXT NOT NULL                  -- 二次医療圏コード
    , iryouken2 TEXT                            -- 二次医療圏
    , prefecture_cd TEXT NOT NULL               -- 都道府県コード
    , prefecture TEXT NOT NULL                  -- 都道府県名
    , city_code TEXT NOT NULL                   -- 市区町村コード
    , city TEXT NOT NULL                        -- 市区町村
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , update_ymd TEXT default '99999999' NOT NULL -- データ登録年月日
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt_iryouken2_act ADD CONSTRAINT mt_iryouken2_act_pkey PRIMARY KEY (city_code, update_ymd)
; 

ALTER TABLE milscm4.mt_iryouken2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iryouken2_act TO pgappl11; 

CREATE TABLE milscm4.mt_old_new_iyakuhin_act( 
    siko_ymd TEXT default '99999999' NOT NULL   -- 施行年月日
    , old_iyakuhin_cd TEXT NOT NULL             -- 旧医薬品コード
    , new_iyakuhin_cd TEXT NOT NULL             -- 新医薬品コード
    , update_ymd TEXT default '99999999' NOT NULL -- データ登録年月日
); 

ALTER TABLE ONLY milscm4.mt_old_new_iyakuhin_act ADD CONSTRAINT mt_old_new_iyakuhin_act_pkey PRIMARY
 KEY (siko_ymd, old_iyakuhin_cd, new_iyakuhin_cd); 

ALTER TABLE milscm4.mt_old_new_iyakuhin_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_old_new_iyakuhin_act TO pgappl11; 

CREATE TABLE milscm4.mt_dpc6_icd_act( 
    siko_ymd TEXT default '99999999' NOT NULL   -- 施行年月日
    , henkou_kubun TEXT NOT NULL                -- 変更区分
    , dpc2_cd TEXT NOT NULL                     -- DPCコード2桁
    , dpc6_cd TEXT NOT NULL                     -- DPCコード6桁
    , icd10_cd TEXT NOT NULL                    -- ICD10コード
    , icd10_name TEXT NOT NULL                  -- ICD名
    , start_ymd TEXT default '00000000' NOT NULL -- 有効期間_開始年月日
    , end_ymd TEXT default '99999999' NOT NULL  -- 有効期間_終了年月日
    , update_ymd TEXT default '99999999' NOT NULL -- データ登録年月日
); 

ALTER TABLE ONLY milscm4.mt_dpc6_icd_act ADD CONSTRAINT mt_dpc6_icd_act_pkey PRIMARY KEY (icd10_cd, start_ymd)
; 

ALTER TABLE milscm4.mt_dpc6_icd_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_dpc6_icd_act TO pgappl11; 

CREATE TABLE milscm4.mt_syusyokugo_act( 
    henkou_kubun TEXT NOT NULL                  -- 変更区分
    , master_type TEXT                          -- マスター種別
    , syusyokugo_cd TEXT NOT NULL               -- 修飾語コード
    , reserve1 TEXT                             -- 予備1
    , reserve2 TEXT                             -- 予備2
    , syusyokugo_name_ketasu INTEGER            -- 修飾語名称桁数
    , syusyokugo_name TEXT                      -- 修飾語名称
    , reserve3 TEXT                             -- 予備3
    , syusyokugo_kana_name_ketasu INTEGER       -- 修飾語カナ名称桁数
    , syusyokugo_kana_name TEXT                 -- 修飾語カナ名称
    , reserve4 TEXT                             -- 予備4
    , syusyokugo_name_henkou TEXT               -- 修飾語名称（変更情報）
    , syusyokugo_kana_name_henkou TEXT          -- 修飾語カナ名称（変更情報）
    , syusai_ymd TEXT                           -- 収載年月日
    , henko_ymd TEXT                            -- 変更年月日
    , haishi_ymd TEXT                           -- 廃止年月日
    , syusyokugo_kanri_no INTEGER               -- 修飾語管理番号
    , syusyokugo_koukan_cd TEXT                 -- 修飾語交換用コード
    , syusyokugo_kubun TEXT                     -- 修飾語区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_syusyokugo_act ADD CONSTRAINT mt_syusyokugo_act_pkey PRIMARY KEY (henkou_kubun, syusyokugo_cd, update_ymd)
; 

ALTER TABLE milscm4.mt_syusyokugo_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_syusyokugo_act TO pgappl11; 

CREATE TABLE milscm4.mt_comment_act( 
    henkou_kubun TEXT NOT NULL                  -- 変更区分
    , master_type TEXT NOT NULL                 -- マスター種別
    , comment_cd TEXT NOT NULL                  -- コメントコード区分
    , comment_cd_pattern TEXT NOT NULL          -- コメントコードパターン
    , comment_cd_seq TEXT NOT NULL              -- コメントコード一連番号
    , comment_sentence_kanji_ketasu INTEGER     -- コメント文漢字有効桁数
    , comment_sentence_kanji_name TEXT          -- コメント文漢字名称
    , comment_sentence_kana_ketasu INTEGER      -- コメント文カナ有効桁数
    , comment_sentence_kana_name TEXT           -- コメント文カナ名称
    , recept_hensyu_info1_column_position INTEGER -- レセプト編集情報1カラム位置
    , recept_hensyu_info1_ketasu INTEGER        -- レセプト編集情報1桁数
    , recept_hensyu_info2_column_position INTEGER -- レセプト編集情報2カラム位置
    , recept_hensyu_info2_ketasu INTEGER        -- レセプト編集情報2桁数
    , recept_hensyu_info3_column_position INTEGER -- レセプト編集情報3カラム位置
    , recept_hensyu_info3_ketasu INTEGER        -- レセプト編集情報3桁数
    , recept_hensyu_info4_column_position INTEGER -- レセプト編集情報4カラム位置
    , recept_hensyu_info4_ketasu INTEGER        -- レセプト編集情報4桁数
    , reserve1 TEXT                             -- 予備1
    , reserve2 TEXT                             -- 予備2
    , selective_comment_identification INTEGER  -- 選択式コメント識別
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

ALTER TABLE ONLY milscm4.mt_comment_act ADD CONSTRAINT mt_comment_act_pkey PRIMARY KEY ( 
    henkou_kubun
    , comment_cd
    , comment_cd_pattern
    , comment_cd_seq
    , update_ymd
); 

ALTER TABLE milscm4.mt_comment_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_comment_act TO pgappl11; 

CREATE TABLE milscm4.mt_seibunryo_act( 
    yj_code TEXT NOT NULL                       -- ＹＪコード
    , haigozai_f TEXT NOT NULL                  -- 配合剤フラグ
    , seibun_group_code TEXT NOT NULL           -- 成分グループコード
    , seibun_code TEXT NOT NULL                 -- 成分コード
    , seibunryo NUMERIC                         -- 成分量
    , seibun_unit_code TEXT                     -- 成分単位コード
    , kokuji_kikakuryo NUMERIC                  -- 告示規格量
    , kokuji_kikaku_unit_code TEXT              -- 告示規格単位コード
    , bikou TEXT                                -- 備考
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_seibunryo_act ADD CONSTRAINT mt_seibunryo_act_pkey PRIMARY KEY (yj_code, seibun_code, koshin_kubun, update_ymd)
; 

ALTER TABLE milscm4.mt_seibunryo_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_seibunryo_act TO pgappl11; 

CREATE TABLE milscm4.mt_seibun_name_act( 
    management_id TEXT NOT NULL                 -- 管理ID
    , seibun_oya_level TEXT                     -- 成分親レベル
    , seibun_oya_code TEXT NOT NULL             -- 成分親コード
    , seibun_code TEXT NOT NULL                 -- 成分コード
    , seibun_name TEXT NOT NULL                 -- 成分名
    , tanmi_f TEXT                              -- 単味フラグ
    , haigo_f TEXT                              -- 配合フラグ
    , time_stamp TEXT                           -- タイムスタンプ
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_seibun_name_act ADD CONSTRAINT mt_seibun_name_act_pkey PRIMARY KEY ( 
    seibun_oya_code
    , seibun_code
    , koshin_kubun
    , update_ymd
); 

ALTER TABLE milscm4.mt_seibun_name_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_seibun_name_act TO pgappl11; 

CREATE TABLE milscm4.mt_unit_act( 
    unit_code TEXT NOT NULL                     -- 単位コード
    , unit_name TEXT                            -- 単位名称
    , unit_kansan_keisu TEXT                    -- 単位換算係数
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_unit_act ADD CONSTRAINT mt_unit_act_pkey PRIMARY KEY (unit_code, koshin_kubun, update_ymd)
; 

ALTER TABLE milscm4.mt_unit_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_unit_act TO pgappl11; 

CREATE TABLE milscm4.mt_tekiyou_recept_combi_link_act( 
    tekiyou_byoumei_link_code TEXT NOT NULL     -- 適用病名組み合わせコード
    , tekiyou_byoumei_code TEXT NOT NULL        -- 適用病名コード
    , shikkan_code TEXT NOT NULL                -- 疾患コード
    , shikkan_name TEXT                         -- 疾患名
    , haishi_ymd TEXT                           -- 廃止年月日
    , hoken_tekiyougai_f TEXT                   -- 保険適用外フラグ
    , icd10_code TEXT                           -- ICD10
    , kumiawase_code TEXT                       -- 組み合わせコード
    , kankeisei_code TEXT                       -- 関係性レベルコード
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_tekiyou_recept_combi_link_act ADD CONSTRAINT mt_tekiyou_recept_combi_link_act_pkey
 PRIMARY KEY ( 
    tekiyou_byoumei_link_code
    , tekiyou_byoumei_code
    , shikkan_code
    , koshin_kubun
    , update_ymd
); 

ALTER TABLE milscm4.mt_tekiyou_recept_combi_link_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_tekiyou_recept_combi_link_act TO pgappl11; 

CREATE TABLE milscm4.mt_tekiyou_recept_combi_link_oyako_act( 
    tekiyou_byoumei_link_code TEXT NOT NULL     -- 適用病名組み合わせコード
    , yj_code TEXT NOT NULL                     -- ＹＪコード
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_tekiyou_recept_combi_link_oyako_act ADD CONSTRAINT mt_tekiyou_recept_combi_link_oyako_act_pkey
 PRIMARY KEY ( 
    tekiyou_byoumei_link_code
    , yj_code
    , koshin_kubun
    , update_ymd
); 

ALTER TABLE milscm4.mt_tekiyou_recept_combi_link_oyako_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_tekiyou_recept_combi_link_oyako_act TO pgappl11; 

CREATE TABLE milscm4.mt_tekiyou_byoumei_act( 
    yougo_code1 TEXT                            -- 用語コード１
    , yougo_code2 TEXT                          -- 用語コード２
    , yougo_code3 TEXT                          -- 用語コード３
    , tekiyou_byoumei_code TEXT NOT NULL        -- 適用病名コード
    , tekiyou_byoumei_name TEXT NOT NULL        -- 適用病名
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_tekiyou_byoumei_act ADD CONSTRAINT mt_tekiyou_byoumei_act_pkey PRIMARY KEY
 (tekiyou_byoumei_code, koshin_kubun, update_ymd); 

ALTER TABLE milscm4.mt_tekiyou_byoumei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_tekiyou_byoumei_act TO pgappl11; 

CREATE TABLE milscm4.mt_yjcode_receptdensancode_link_act( 
    yj_code TEXT                                -- ＹＪコード
    , iyakuhin_code TEXT                        -- 医薬品コード
    , iyakuhin_ippan_name TEXT                  -- 医薬品一般名
    , iyakuhin_name TEXT                        -- 医薬品名
    , kikaku_naiyou TEXT                        -- 規格内容
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_yjcode_receptdensancode_link_act ADD CONSTRAINT mt_yjcode_receptdensancode_link_act_pkey
 PRIMARY KEY (yj_code, koshin_kubun, update_ymd); 

ALTER TABLE milscm4.mt_yjcode_receptdensancode_link_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yjcode_receptdensancode_link_act TO pgappl11; 

CREATE TABLE milscm4.mt_shinryo_koi_fuka_act( 
    koshin_kubun TEXT NOT NULL                  -- 更新区分
    , master_type TEXT NOT NULL                 -- マスター種別
    , shinryo_koi_code TEXT NOT NULL            -- 診療行為コード
    , shinryo_koi_kanji_name_ketasu INTEGER     -- 診療行為省略漢字有効桁数
    , shinryo_koi_kanji_name TEXT               -- 診療行為省略漢字名称
    , shinryo_koi_kana_name_ketasu INTEGER      -- 診療行為省略カナ有効桁数
    , shinryo_koi_kana_name TEXT                -- 診療行為省略カナ名称
    , data_standard_code TEXT                   -- データ規格コード
    , data_standard_ketasu INTEGER              -- データ規格漢字有効桁数
    , data_standard_name TEXT                   -- データ規格漢字名称
    , gen_tensu_shikibetsu INTEGER              -- 新又は現点数識別
    , gen_tensu NUMERIC                         -- 新又は現点数
    , nyugai_tekiyo_kubun TEXT                  -- 入外適用区分
    , aged_tekiyo_kubun TEXT                    -- 後期高齢者医療適用区分
    , tensuran_shikibetsu_nyuingai TEXT         -- 点数欄集計先識別（入院外）
    , hokatsu_kensa TEXT                        -- 包括対象検査
    , reserve1 TEXT                             -- 予備1
    , dpc_tekiyo_kubun TEXT                     -- DPC適用区分
    , clinic_kubun TEXT                         -- 病院・診療所区分
    , shujutsu_kasan_kubun TEXT                 -- 画像等手術支援加算区分
    , iryo_kansatsu_kubun TEXT                  -- 医療観察法対象区分
    , kango_kasan TEXT                          -- 看護加算
    , masui_shujutsu_kubun TEXT                 -- 麻酔識別区分
    , reserve2 TEXT                             -- 予備2
    , shobyo_kanren_kubun TEXT                  -- 傷病名関連区分
    , reserve3 TEXT                             -- 予備3
    , jitsu_days INTEGER                        -- 実日数
    , days_times INTEGER                        -- 日数・回数
    , iyakuhin_kanren_kubun TEXT                -- 医薬品関連区分
    , kizami_keisan_shikibetsu TEXT             -- きざみ値計算識別
    , kizami_low INTEGER                        -- きざみ値下限値
    , kizami_up INTEGER                         -- きざみ値上限値
    , kizami_value INTEGER                      -- きざみ値
    , kizami_tensu NUMERIC                      -- きざみ点数
    , up_low_error TEXT                         -- 上下限エラー処理
    , up_times INTEGER                          -- 上限回数
    , up_times_error TEXT                       -- 上限回数エラー処理
    , chu_kasan_code TEXT                       -- 注加算コード
    , chu_kasan_no TEXT                         -- 注加算通番
    , tsusoku_age TEXT                          -- 通則年齢
    , low_age TEXT                              -- 下限年齢
    , up_age TEXT                               -- 上限年齢
    , time_kasan_kubun TEXT                     -- 時間加算区分
    , tekigo_kubun TEXT                         -- 適合区分
    , facility_kijun TEXT                       -- 対象施設基準
    , nyuyoji_kasan_kubun TEXT                  -- 処置乳幼児加算区分
    , taijuji_kasan_kubun TEXT                  -- 極低出生体重児加算区分
    , nyuin_kihon_gensan_shikibetsu TEXT        -- 入院基本料等減算対象識別
    , donor_kubun TEXT                          -- ドナー分集計区分
    , kensa_handan_kubun TEXT                   -- 検査等実施判断区分
    , kensa_handan_group_kubun TEXT             -- 検査等実施判断グループ区分
    , teigen_kubun TEXT                         -- 逓減対象区分
    , sekizui_kasan_kubun TEXT                  -- 脊髄誘発電位測定等加算区分
    , keibu_kasan_kubun TEXT                    -- 頸部郭清術併施加算区分
    , hogoki_kasan_kubun TEXT                   -- 自動縫合器加算区分
    , gairai_kasan_kubun TEXT                   -- 外来管理加算区分
    , old_tensu_shikibetsu TEXT                 -- 旧点数識別
    , old_tensu NUMERIC                         -- 旧点数
    , kanji_henko_kubun TEXT                    -- 漢字名称変更区分
    , kana_henko_kubun TEXT                     -- カナ名称変更区分
    , kentai_comment TEXT                       -- 検体検査コメント
    , tsusoku_kasan_tensu TEXT                  -- 通則加算所定点数対象区分
    , hokatsu_teigen_kubun TEXT                 -- 包括逓減区分
    , choonpa_naishikyo_kasan_kubun TEXT        -- 超音波内視鏡加算区分
    , reserve4 TEXT                             -- 予備4
    , tensuran_shikibetsu_nyuin TEXT            -- 点数欄集計先識別（入院）
    , fungoki_kasan_kubun TEXT                  -- 自動吻合器加算区分
    , kokuji_shikibetsu_kubun1 TEXT             -- 告示等識別区分1
    , kokuji_shikibetsu_kubun2 TEXT             -- 告示等識別区分2
    , chiiki_kasan TEXT                         -- 地域加算
    , bed_su_kubun TEXT                         -- 病床数区分
    , facility_kijun_code1 TEXT                 -- 施設基準コード1
    , facility_kijun_code2 TEXT                 -- 施設基準コード2
    , facility_kijun_code3 TEXT                 -- 施設基準コード3
    , facility_kijun_code4 TEXT                 -- 施設基準コード4
    , facility_kijun_code5 TEXT                 -- 施設基準コード5
    , facility_kijun_code6 TEXT                 -- 施設基準コード6
    , facility_kijun_code7 TEXT                 -- 施設基準コード7
    , facility_kijun_code8 TEXT                 -- 施設基準コード8
    , facility_kijun_code9 TEXT                 -- 施設基準コード9
    , facility_kijun_code10 TEXT                -- 施設基準コード10
    , choonpa_sekkai_kasan_kubun TEXT           -- 超音波凝固切開装置等加算区分
    , tanki_shujutsu TEXT                       -- 短期滞在手術
    , shika_tekiyo_kubun TEXT                   -- 歯科適用区分
    , code_table_alphabet TEXT                  -- コード表用番号（アルファベット部）
    , kokuji_kanren_no_alphabet TEXT            -- 告示・通知関連番号（アルファベット部）
    , henko_ymd TEXT                            -- 変更年月日
    , haishi_ymd TEXT                           -- 廃止年月日
    , kohyo_junjo_no TEXT                       -- 公表順序番号
    , code_table_no_sho TEXT                    -- コード表用番号_章
    , code_table_no_bu TEXT                     -- コード表用番号_部
    , code_table_no_kubun TEXT                  -- コード表用番号_区分番号
    , code_table_no_edaban TEXT                 -- コード表用番号_枝番
    , code_table_no_koban TEXT                  -- コード表用番号_項番
    , kokuji_kanren_no_sho TEXT                 -- 告示・通知関連番号_章
    , kokuji_kanren_no_bu TEXT                  -- 告示・通知関連番号_部
    , kokuji_kanren_no_kubun TEXT               -- 告示・通知関連番号_区分番号
    , kokuji_kanren_no_edaban TEXT              -- 告示・通知関連番号_枝番
    , kokuji_kanren_no_koban TEXT               -- 告示・通知関連番号_項番
    , age1_kasan_low TEXT                       -- 年齢加算1下限年齢
    , age1_kasan_up TEXT                        -- 年齢加算1上限年齢
    , age1_kasan_koi_code TEXT                  -- 年齢加算1注加算診療行為コード
    , age2_kasan_low TEXT                       -- 年齢加算2下限年齢
    , age2_kasan_up TEXT                        -- 年齢加算2上限年齢
    , age2_kasan_koi_code TEXT                  -- 年齢加算2注加算診療行為コード
    , age3_kasan_low TEXT                       -- 年齢加算3下限年齢
    , age3_kasan_up TEXT                        -- 年齢加算3上限年齢
    , age3_kasan_koi_code TEXT                  -- 年齢加算3注加算診療行為コード
    , age4_kasan_low TEXT                       -- 年齢加算4下限年齢
    , age4_kasan_up TEXT                        -- 年齢加算4上限年齢
    , age4_kasan_koi_code TEXT                  -- 年齢加算4注加算診療行為コード
    , ido_kanren TEXT                           -- 異動関連
    , kihon_kanji_name TEXT                     -- 基本漢字名称
    , fukubiko_naishikyo_kasan TEXT             -- 副鼻腔手術用内視鏡加算
    , fukubiko_kotsunanbu_kasan TEXT            -- 副鼻腔手術用骨軟部組織切除機器加算
    , long_masui_kasan TEXT                     -- 長時間麻酔管理加算
    , tensu_kubun_no TEXT                       -- 点数表区分番号
    , monitoring_kasan TEXT                     -- モニタリング加算
    , toketsu_hozon_kasan TEXT                  -- 凍結保存同種組織加算
    , akusei_shuyo_kasan TEXT                   -- 悪性腫瘍病理組織標本加算
    , sogai_kotei_kasan TEXT                    -- 創外固定器加算
    , chouonpa_sessaku_kasan TEXT               -- 超音波切削機器加算
    , sashin_jiheisa_kasan TEXT                 -- 左心耳閉鎖術併施加算
    , gairai_kansen_taisaku_koujo_kubun TEXT    -- 外来感染対策向上加算等
    , jibi_inko_nyuyoji_kasan TEXT              -- 耳鼻咽喉科乳幼児処置加算
    , jibi_inko_shoni_koukin_tekisei_shiyou_shien_kasan TEXT -- 耳鼻咽喉科小児抗菌薬適正使用支援加算
    , sekkaisou_kyokusho_inatsu_heisa_shochi_kasan TEXT -- 切開創局所陰圧閉鎖処置機器加算
    , reserve5 TEXT                             -- 予備5
    , reserve6 TEXT                             -- 予備6
    , reserve7 TEXT                             -- 予備7
    , reserve8 TEXT                             -- 予備8
    , reserve9 TEXT                             -- 予備9
    , reserve10 TEXT                            -- 予備10
    , reserve11 TEXT                            -- 予備11
    , reserve12 TEXT                            -- 予備12
    , reserve13 TEXT                            -- 予備13
    , reserve14 TEXT                            -- 予備14
    , reserve15 TEXT                            -- 予備15
    , reserve16 TEXT                            -- 予備16
    , reserve17 TEXT                            -- 予備17
    , reserve18 TEXT                            -- 予備18
    , reserve19 TEXT                            -- 予備19
    , reserve20 TEXT                            -- 予備20
    , reserve21 TEXT                            -- 予備21
    , reserve22 TEXT                            -- 予備22
    , reserve23 TEXT                            -- 予備23
    , reserve24 TEXT                            -- 予備24
    , reserve25 TEXT                            -- 予備25
    , reserve26 TEXT                            -- 予備26
    , reserve27 TEXT                            -- 予備27
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_shinryo_koi_fuka_act ADD CONSTRAINT mt_shinryo_koi_fuka_act_pkey PRIMARY
 KEY (koshin_kubun, shinryo_koi_code, update_ymd); 

ALTER TABLE milscm4.mt_shinryo_koi_fuka_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_shinryo_koi_fuka_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , iyakuhin_code TEXT NOT NULL               -- 医薬品コード
    , yakko_bunrui1_code TEXT NOT NULL          -- 薬効分類1コード
    , yakko_bunrui2_code TEXT NOT NULL          -- 薬効分類2コード
    , yakko_bunrui3_code TEXT NOT NULL          -- 薬効分類3コード
    , yakko_bunrui4_code TEXT NOT NULL          -- 薬効分類4コード
    , yakko_bunrui5_code TEXT NOT NULL          -- 薬効分類5コード
    , seizo_maker_code TEXT NOT NULL            -- 製造メーカコード
    , iyakuhin_name TEXT NOT NULL               -- 医薬品名
    , iyakuhin_jpn_name TEXT NOT NULL           -- 医薬品日本語名
    , kohatsuhin_flag TEXT NOT NULL             -- 後発品フラグ
    , shinyaku_code TEXT                        -- 新薬コード
    , iyakuhin_brand_code TEXT NOT NULL         -- 医薬品ブランドコード
    , iyakuhin_ippan_name_code TEXT NOT NULL    -- 医薬品一般名コード
    , toyo_keiro_kubun TEXT NOT NULL            -- 投与経路区分
    , tokutei_kizai_unit_code TEXT              -- 特定器材単位コード
    , hatsubai_ymd TEXT NOT NULL                -- 発売年月日
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_act ADD CONSTRAINT mt_iyakuhin_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, iyakuhin_code)
; 

ALTER TABLE milscm4.mt_iyakuhin_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_brand_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , iyakuhin_brand_code TEXT NOT NULL         -- 医薬品ブランドコード
    , iyakuhin_brand_name TEXT NOT NULL         -- 医薬品ブランド名
    , iyakuhin_brand_jpn_name TEXT NOT NULL     -- 医薬品ブランド日本語名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_brand_act ADD CONSTRAINT mt_iyakuhin_brand_act_pkey PRIMARY KEY
 (sekoubi, koshin_kubun, iyakuhin_brand_code); 

ALTER TABLE milscm4.mt_iyakuhin_brand_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_brand_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_ippan_name_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , iyakuhin_ippan_name_code TEXT NOT NULL    -- 医薬品一般名コード
    , iyakuhin_ippan_name TEXT NOT NULL         -- 医薬品一般名
    , iyakuhin_ippan_englishname TEXT NOT NULL  -- 医薬品一般名英名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_ippan_name_act ADD CONSTRAINT mt_iyakuhin_ippan_name_act_pkey PRIMARY
 KEY (sekoubi, koshin_kubun, iyakuhin_ippan_name_code); 

ALTER TABLE milscm4.mt_iyakuhin_ippan_name_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_ippan_name_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_sales_kaisha_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , iyakuhin_code TEXT NOT NULL               -- 医薬品コード
    , maker_code TEXT NOT NULL                  -- メーカコード
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_sales_kaisha_act ADD CONSTRAINT mt_iyakuhin_sales_kaisha_act_pkey
 PRIMARY KEY ( 
    sekoubi
    , koshin_kubun
    , iyakuhin_code
    , maker_code
); 

ALTER TABLE milscm4.mt_iyakuhin_sales_kaisha_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_sales_kaisha_act TO pgappl11; 

CREATE TABLE milscm4.mt_maker_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , maker_code TEXT NOT NULL                  -- メーカコード
    , maker_name TEXT NOT NULL                  -- メーカ名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_maker_act ADD CONSTRAINT mt_maker_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, maker_code)
; 

ALTER TABLE milscm4.mt_maker_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_maker_act TO pgappl11; 

CREATE TABLE milscm4.mt_price_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , iyakuhin_code TEXT NOT NULL               -- 医薬品コード
    , nendo TEXT NOT NULL                       -- 年度
    , price NUMERIC NOT NULL                    -- 薬価
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_price_act ADD CONSTRAINT mt_price_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, iyakuhin_code)
; 

ALTER TABLE milscm4.mt_price_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_price_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc1_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , yakko_bunrui1_code TEXT NOT NULL          -- 薬効分類1コード
    , yakko_bunrui1_name TEXT NOT NULL          -- 薬効分類1名
    , yakko_bunrui1_jpn_name TEXT NOT NULL      -- 薬効分類1日本語名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_yakko_atc1_act ADD CONSTRAINT mt_yakko_atc1_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, yakko_bunrui1_code)
; 

ALTER TABLE milscm4.mt_yakko_atc1_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yakko_atc1_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc2_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , yakko_bunrui1_code TEXT NOT NULL          -- 薬効分類1コード
    , yakko_bunrui2_code TEXT NOT NULL          -- 薬効分類2コード
    , yakko_bunrui2_name TEXT NOT NULL          -- 薬効分類2名
    , yakko_bunrui2_jpn_name TEXT NOT NULL      -- 薬効分類2日本語名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_yakko_atc2_act ADD CONSTRAINT mt_yakko_atc2_act_pkey PRIMARY KEY ( 
    sekoubi
    , koshin_kubun
    , yakko_bunrui1_code
    , yakko_bunrui2_code
); 

ALTER TABLE milscm4.mt_yakko_atc2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yakko_atc2_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc3_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , yakko_bunrui1_code TEXT NOT NULL          -- 薬効分類1コード
    , yakko_bunrui2_code TEXT NOT NULL          -- 薬効分類2コード
    , yakko_bunrui3_code TEXT NOT NULL          -- 薬効分類3コード
    , yakko_bunrui3_name TEXT NOT NULL          -- 薬効分類3名
    , yakko_bunrui3_jpn_name TEXT NOT NULL      -- 薬効分類3日本語名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_yakko_atc3_act ADD CONSTRAINT mt_yakko_atc3_act_pkey PRIMARY KEY ( 
    sekoubi
    , koshin_kubun
    , yakko_bunrui1_code
    , yakko_bunrui2_code
    , yakko_bunrui3_code
); 

ALTER TABLE milscm4.mt_yakko_atc3_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yakko_atc3_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc4_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , yakko_bunrui1_code TEXT NOT NULL          -- 薬効分類1コード
    , yakko_bunrui2_code TEXT NOT NULL          -- 薬効分類2コード
    , yakko_bunrui3_code TEXT NOT NULL          -- 薬効分類3コード
    , yakko_bunrui4_code TEXT NOT NULL          -- 薬効分類4コード
    , yakko_bunrui4_name TEXT NOT NULL          -- 薬効分類4名
    , yakko_bunrui4_jpn_name TEXT NOT NULL      -- 薬効分類4日本語名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_yakko_atc4_act ADD CONSTRAINT mt_yakko_atc4_act_pkey PRIMARY KEY ( 
    sekoubi
    , koshin_kubun
    , yakko_bunrui1_code
    , yakko_bunrui2_code
    , yakko_bunrui3_code
    , yakko_bunrui4_code
); 

ALTER TABLE milscm4.mt_yakko_atc4_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yakko_atc4_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc5_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , yakko_bunrui1_code TEXT NOT NULL          -- 薬効分類1コード
    , yakko_bunrui2_code TEXT NOT NULL          -- 薬効分類2コード
    , yakko_bunrui3_code TEXT NOT NULL          -- 薬効分類3コード
    , yakko_bunrui4_code TEXT NOT NULL          -- 薬効分類4コード
    , yakko_bunrui5_code TEXT NOT NULL          -- 薬効分類5コード
    , yakko_bunrui5_name TEXT NOT NULL          -- 薬効分類5名
    , yakko_bunrui5_jpn_name TEXT NOT NULL      -- 薬効分類5日本語名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_yakko_atc5_act ADD CONSTRAINT mt_yakko_atc5_act_pkey PRIMARY KEY ( 
    sekoubi
    , koshin_kubun
    , yakko_bunrui1_code
    , yakko_bunrui2_code
    , yakko_bunrui3_code
    , yakko_bunrui4_code
    , yakko_bunrui5_code
); 

ALTER TABLE milscm4.mt_yakko_atc5_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yakko_atc5_act TO pgappl11; 

CREATE TABLE milscm4.mt_shippei_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , shippei_code TEXT NOT NULL                -- 疾病コード
    , icd10_1_l_code TEXT                       -- ICD10-1大分類コード
    , icd10_1_m_code TEXT                       -- ICD10-1中分類コード
    , icd10_1_s_code TEXT                       -- ICD10-1小分類コード
    , icd10_1_ss_code TEXT                      -- ICD10-1細分類コード
    , icd10_2_l_code TEXT                       -- ICD10-2大分類コード
    , icd10_2_m_code TEXT                       -- ICD10-2中分類コード
    , icd10_2_s_code TEXT                       -- ICD10-2小分類コード
    , icd10_2_ss_code TEXT                      -- ICD10-2細分類コード
    , shippei_name TEXT NOT NULL                -- 疾病名
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_shippei_act ADD CONSTRAINT mt_shippei_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, shippei_code)
; 

ALTER TABLE milscm4.mt_shippei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_shippei_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_l_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , icd10_l_code TEXT NOT NULL                -- ICD10大分類コード
    , icd10_l_name TEXT NOT NULL                -- ICD10大分類名
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_icd10_l_act ADD CONSTRAINT mt_icd10_l_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_l_code)
; 

ALTER TABLE milscm4.mt_icd10_l_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_l_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_m_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , icd10_m_code TEXT NOT NULL                -- ICD10中分類コード
    , icd10_m_name TEXT NOT NULL                -- ICD10中分類名
    , icd10_l_code TEXT NOT NULL                -- ICD10大分類コード
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_icd10_m_act ADD CONSTRAINT mt_icd10_m_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_m_code)
; 

ALTER TABLE milscm4.mt_icd10_m_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_m_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_s_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , icd10_s_code TEXT NOT NULL                -- ICD10小分類コード
    , icd10_s_name TEXT NOT NULL                -- ICD10小分類名
    , icd10_l_code TEXT NOT NULL                -- ICD10大分類コード
    , icd10_m_code TEXT NOT NULL                -- ICD10中分類コード
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_icd10_s_act ADD CONSTRAINT mt_icd10_s_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_s_code)
; 

ALTER TABLE milscm4.mt_icd10_s_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_s_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_ss_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , icd10_ss_code TEXT NOT NULL               -- ICD10細分類コード
    , icd10_ss_name TEXT NOT NULL               -- ICD10細分類名
    , icd10_l_code TEXT NOT NULL                -- ICD10大分類コード
    , icd10_m_code TEXT NOT NULL                -- ICD10中分類コード
    , icd10_s_code TEXT NOT NULL                -- ICD10小分類コード
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_icd10_ss_act ADD CONSTRAINT mt_icd10_ss_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_ss_code)
; 

ALTER TABLE milscm4.mt_icd10_ss_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_ss_act TO pgappl11; 

CREATE TABLE milscm4.mt_dpc2_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , henkou_kubun TEXT NOT NULL                -- 変更区分
    , dpc2_code TEXT NOT NULL                   -- DPCコード2桁
    , dpc2_name TEXT NOT NULL                   -- DPC2桁名
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_dpc2_act ADD CONSTRAINT mt_dpc2_act_pkey PRIMARY KEY (sekoubi, dpc2_code)
; 

ALTER TABLE milscm4.mt_dpc2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_dpc2_act TO pgappl11; 

CREATE TABLE milscm4.mt_dpc6_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , henkou_kubun TEXT NOT NULL                -- 変更区分
    , dpc2_code TEXT NOT NULL                   -- DPCコード2桁
    , dpc4_code TEXT NOT NULL                   -- DPCコード4桁
    , dpc6_name TEXT NOT NULL                   -- DPC6桁名
    , ikosaki TEXT                              -- 移行先
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_dpc6_act ADD CONSTRAINT mt_dpc6_act_pkey PRIMARY KEY (sekoubi, dpc2_code, dpc4_code)
; 

ALTER TABLE milscm4.mt_dpc6_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_dpc6_act TO pgappl11; 

CREATE TABLE milscm4.mt_postal_act( 
    koshin_kubun TEXT NOT NULL                  -- 更新区分
    , postal_code TEXT NOT NULL                 -- 郵便番号
    , prefecture_code TEXT NOT NULL             -- 都道府県コード
    , city_code TEXT NOT NULL                   -- 市区町村コード
); 

ALTER TABLE ONLY milscm4.mt_postal_act ADD CONSTRAINT mt_postal_act_pkey PRIMARY KEY ( 
    koshin_kubun
    , postal_code
    , prefecture_code
    , city_code
); 

ALTER TABLE milscm4.mt_postal_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_postal_act TO pgappl11; 

CREATE TABLE milscm4.mt_tokutei_kizai_act( 
    sekoubi TEXT NOT NULL                       -- 施行日
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , tokutei_kizai_cd TEXT NOT NULL            -- 特定器材コード
    , tokutei_kizai_name TEXT NOT NULL          -- 特定器材名・規格名
    , tokutei_kizai_tani TEXT                   -- 単位
    , tokutei_kizai_kingaku NUMERIC NOT NULL    -- 金額
    , nen TEXT NOT NULL                         -- 年
    , nengetsu TEXT NOT NULL                    -- 年月
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_tokutei_kizai_act ADD CONSTRAINT mt_tokutei_kizai_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, tokutei_kizai_cd)
; 

ALTER TABLE milscm4.mt_tokutei_kizai_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_tokutei_kizai_act TO pgappl11; 

CREATE TABLE milscm4.mt2_shisetsu_zokusei_act( 
    facility_id TEXT NOT NULL                   -- 施設ID
    , kijun_ym TEXT default '999999' NOT NULL   -- 基準年月
    , facility_name TEXT NOT NULL               -- 施設名
    , opt_out_ymd TEXT                          -- 通知開始年月日
    , prefecture_cd TEXT NOT NULL               -- 都道府県コード
    , prefecture TEXT NOT NULL                  -- 都道府県名
    , region_cd TEXT NOT NULL                   -- 地方コード
    , region TEXT NOT NULL                      -- 地方名
    , city_cd TEXT NOT NULL                     -- 市区町村コード
    , city TEXT NOT NULL                        -- 市区町村
    , address TEXT NOT NULL                     -- 住所
    , iryouken2_cd TEXT NOT NULL                -- 二次医療圏コード
    , iryouken2 TEXT NOT NULL                   -- 二次医療圏
    , ippan_bed INTEGER                         -- 一般病床
    , seishin_bed INTEGER                       -- 精神病床
    , kansen_bed INTEGER                        -- 感染症病床
    , kekkaku_bed INTEGER                       -- 結核病床
    , ryouyou_bed INTEGER                       -- 療養病床
    , all_bed INTEGER                           -- 総病床数
    , univ_hp_f TEXT                            -- 大学病院F
    , tokutei_hp_f TEXT                         -- 特定機能病院F
    , cancer_hp_f INTEGER                       -- がん拠点病院F
    , high_Acute_care_hp_f TEXT                 -- 高度急性期病院F
    , Acute_care_hp_f TEXT                      -- 急性期病院F
    , mil_exit_f TEXT                           -- 千年カルテ離脱施設フラグ
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
    , shisetsu_update_ymd TEXT default '99999999' NOT NULL -- 施設マスタデータ登録日
    , zokusei_update_ymd TEXT                   -- 施設属性マスタ取込用データ登録日
    , zokusei_torikomi_kijun_ym TEXT            -- 施設属性マスタ取込用取込基準年月
    , mainte_f TEXT default '0' NOT NULL        -- メンテナンスフラグ
); 

ALTER TABLE ONLY milscm4.mt2_shisetsu_zokusei_act ADD CONSTRAINT mt2_shisetsu_zokusei_act_pkey PRIMARY
 KEY (facility_id, kijun_ym); 

ALTER TABLE milscm4.mt2_shisetsu_zokusei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_shisetsu_zokusei_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iryouken2_act( 
    iryouken2_cd TEXT NOT NULL                  -- 二次医療圏コード
    , iryouken2 TEXT NOT NULL                   -- 二次医療圏
    , prefecture_cd TEXT NOT NULL               -- 都道府県コード
    , city_code TEXT NOT NULL                   -- 市区町村コード
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_iryouken2_act ADD CONSTRAINT mt2_iryouken2_act_pkey PRIMARY KEY (city_code, henkou_ymd, del_ymd)
; 

ALTER TABLE milscm4.mt2_iryouken2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iryouken2_act TO pgappl11; 

CREATE TABLE milscm4.mt2_old_new_shisetsu_act( 
    old_facility_id TEXT NOT NULL               -- 旧施設ID
    , new_facility_id TEXT NOT NULL             -- 新施設ID
    , start_ymd TEXT default '99999999' NOT NULL -- 適用開始日
); 

ALTER TABLE ONLY milscm4.mt2_old_new_shisetsu_act ADD CONSTRAINT mt2_old_new_shisetsu_act_pkey PRIMARY
 KEY (old_facility_id); 

ALTER TABLE milscm4.mt2_old_new_shisetsu_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_old_new_shisetsu_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iyakuhin_kanren_act( 
    iyakuhin_cd TEXT NOT NULL                   -- 医薬品コード
    , iyakuhin_brand_cd TEXT NOT NULL           -- 医薬品ブランドコード
    , iyakuhin_ippan_name_cd TEXT NOT NULL      -- 医薬品一般名コード
    , yakko_bunrui1_cd TEXT NOT NULL            -- 薬効分類1コード
    , yakko_bunrui2_cd TEXT NOT NULL            -- 薬効分類2コード
    , yakko_bunrui3_cd TEXT NOT NULL            -- 薬効分類3コード
    , yakko_bunrui4_cd TEXT NOT NULL            -- 薬効分類4コード
    , yakko_bunrui5_cd TEXT NOT NULL            -- 薬効分類5コード
    , seizo_maker_cd TEXT                       -- 製造メーカコード
    , iyakuhin_jpn_name TEXT NOT NULL           -- 医薬品日本語名
    , iyakuhin_brand_jpn_name TEXT NOT NULL     -- 医薬品ブランド名
    , iyakuhin_ippan_name TEXT NOT NULL         -- 医薬品一般名
    , iyakuhin_name TEXT NOT NULL               -- 医薬品一般名英名
    , yakko_bunrui1_jpn_name TEXT NOT NULL      -- 薬効分類1名
    , yakko_bunrui2_jpn_name TEXT NOT NULL      -- 薬効分類2名
    , yakko_bunrui3_jpn_name TEXT NOT NULL      -- 薬効分類3名
    , yakko_bunrui4_jpn_name TEXT NOT NULL      -- 薬効分類4名
    , yakko_bunrui5_jpn_name TEXT NOT NULL      -- 薬効分類5名
    , seizo_maker_name TEXT                     -- 製造メーカ名
    , kohatsuhin_f TEXT default '0' NOT NULL    -- 後発品フラグ
    , toyo_keiro_kubun TEXT NOT NULL            -- 投与経路区分
    , yakkasyusai_ymd TEXT default '99999999' NOT NULL -- 施行年月日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_iyakuhin_kanren_act ADD CONSTRAINT mt2_iyakuhin_kanren_act_pkey PRIMARY
 KEY (iyakuhin_cd, yakkasyusai_ymd); 

ALTER TABLE milscm4.mt2_iyakuhin_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iyakuhin_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_price_kanren_act( 
    iyakuhin_code TEXT NOT NULL                 -- 医薬品コード
    , price NUMERIC NOT NULL                    -- 薬価
    , yakkasyusai_ymd TEXT default '99999999' NOT NULL -- 施行年月日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_price_kanren_act ADD CONSTRAINT mt2_price_kanren_act_pkey PRIMARY KEY (iyakuhin_code, yakkasyusai_ymd)
; 

ALTER TABLE milscm4.mt2_price_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_price_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_shinryo_koi_kanren_act( 
    shinryo_koi_cd TEXT NOT NULL                -- 診療行為コード
    , cd_no TEXT                                -- アルファベットコード
    , cd_no_kubun TEXT                          -- 区分番号
    , cd_no_eda TEXT                            -- 枝番
    , cd_no_koh TEXT                            -- 項番
    , kubun_no TEXT                             -- 点数表区分番号
    , point NUMERIC NOT NULL                    -- 点数
    , shinryo_koi_name TEXT NOT NULL            -- 診療行為省略名
    , shinryo_koi_kihonname TEXT NOT NULL       -- 診療行為名
    , update_ymd TEXT NOT NULL                  -- データ登録日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_shinryo_koi_kanren_act ADD CONSTRAINT mt2_shinryo_koi_kanren_act_pkey PRIMARY
 KEY (shinryo_koi_cd, update_ymd); 

ALTER TABLE milscm4.mt2_shinryo_koi_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_shinryo_koi_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_tokutei_kizai_kanren_act( 
    tokutei_kizai_cd TEXT NOT NULL              -- 特定器材コード
    , tokutei_kizai_name TEXT NOT NULL          -- 特定器材名・規格名
    , tokutei_kizai_tani TEXT                   -- 単位
    , price NUMERIC NOT NULL                    -- 金額
    , siko_ymd TEXT default '99999999' NOT NULL -- 施行年月日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_tokutei_kizai_kanren_act ADD CONSTRAINT mt2_tokutei_kizai_kanren_act_pkey
 PRIMARY KEY (tokutei_kizai_cd, siko_ymd); 

ALTER TABLE milscm4.mt2_tokutei_kizai_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_tokutei_kizai_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_dpc_kanren_act( 
    dpc2_cd TEXT NOT NULL                       -- DPCコード2桁
    , dpc2_name TEXT NOT NULL                   -- DPC2桁名
    , dpc6_cd TEXT NOT NULL                     -- DPCコード6桁
    , dpc6_name TEXT NOT NULL                   -- DPC6桁名
    , siko_ymd TEXT default '99999999' NOT NULL -- 施行年月日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_dpc_kanren_act ADD CONSTRAINT mt2_dpc_kanren_act_pkey PRIMARY KEY (dpc6_cd, siko_ymd)
; 

ALTER TABLE milscm4.mt2_dpc_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_dpc_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_shikkan_kanren_act( 
    shikkan_cd TEXT NOT NULL                    -- 疾患コード
    , icd10_l_cd TEXT                           -- ICD10大分類コード
    , icd10_m_cd TEXT                           -- ICD10中分類コード
    , icd10_s_cd TEXT                           -- ICD10小分類コード
    , icd10_ss_cd TEXT                          -- ICD10細分類コード
    , shikkan_name TEXT NOT NULL                -- 疾患名
    , icd10_l_name TEXT                         -- ICD10大分類名
    , icd10_m_name TEXT                         -- ICD10中分類名
    , icd10_s_name TEXT                         -- ICD10小分類名
    , icd10_ss_name TEXT                        -- ICD10細分類名
    , icd10_kubun TEXT default '0'              -- ICD10区分
    , siko_ymd TEXT default '99999999' NOT NULL -- 施行年月日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_shikkan_kanren_act ADD CONSTRAINT mt2_shikkan_kanren_act_pkey PRIMARY KEY
 (shikkan_cd, icd10_kubun, siko_ymd); 

ALTER TABLE milscm4.mt2_shikkan_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_shikkan_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iyakuhin_seibun_kanren_act( 
    yj_cd TEXT NOT NULL                         -- ＹＪコード
    , iyakuhin_cd TEXT                          -- 医薬品コード
    , iyakuhin_name TEXT                        -- 医薬品名
    , haigozai_f TEXT NOT NULL                  -- 配合剤フラグ
    , seibun_group_cd TEXT NOT NULL             -- 成分グループコード
    , seibun_cd TEXT NOT NULL                   -- 成分コード
    , seibun_name TEXT NOT NULL                 -- 成分名
    , seibunryo NUMERIC                         -- 成分量
    , seibun_unit_cd TEXT                       -- 成分単位コード
    , seibun_unit_name TEXT                     -- 成分単位名称
    , kokuji_kikakuryo NUMERIC                  -- 告示規格量
    , kokuji_kikaku_unit_cd TEXT                -- 告示規格単位コード
    , kokuji_kikaku_unit_name TEXT              -- 告示規格単位名称
    , kikaku_naiyou TEXT                        -- 規格内容
    , bikou TEXT                                -- 備考
    , update_ymd TEXT default '99999999' NOT NULL -- データ登録日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_iyakuhin_seibun_kanren_act ADD CONSTRAINT mt2_iyakuhin_seibun_kanren_act_pkey
 PRIMARY KEY (yj_cd, seibun_cd, update_ymd); 

ALTER TABLE milscm4.mt2_iyakuhin_seibun_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iyakuhin_seibun_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iyakuhin_tekiyou_byomei_kanren_act( 
    yj_cd TEXT NOT NULL                         -- ＹＪコード
    , iyakuhin_cd TEXT                          -- 医薬品コード
    , iyakuhin_name TEXT                        -- 医薬品名
    , tekiyou_byoumei_cd TEXT NOT NULL          -- 適用病名コード
    , tekiyou_byoumei_name TEXT NOT NULL        -- 適用病名
    , shikkan_cd TEXT NOT NULL                  -- 疾患コード
    , shikkan_name TEXT                         -- 疾患名
    , kumiawase_cd TEXT                         -- 組み合わせコード
    , kankeisei_cd TEXT                         -- 関係性レベルコード
    , update_ymd TEXT default '99999999' NOT NULL -- データ登録日
    , new_f TEXT default '0' NOT NULL           -- 最新フラグ
    , del_f TEXT default '0' NOT NULL           -- 削除フラグ
    , henkou_ymd TEXT default '99999999' NOT NULL -- 変更年月日
    , del_ymd TEXT default '99999999' NOT NULL  -- 廃止年月日
); 

ALTER TABLE ONLY milscm4.mt2_iyakuhin_tekiyou_byomei_kanren_act ADD CONSTRAINT mt2_iyakuhin_tekiyou_byomei_kanren_act_pkey
 PRIMARY KEY ( 
    yj_cd
    , tekiyou_byoumei_cd
    , shikkan_cd
    , update_ymd
); 

ALTER TABLE milscm4.mt2_iyakuhin_tekiyou_byomei_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iyakuhin_tekiyou_byomei_kanren_act TO pgappl11;
