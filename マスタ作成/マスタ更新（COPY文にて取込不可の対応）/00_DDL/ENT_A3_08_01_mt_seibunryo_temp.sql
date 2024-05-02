-- DROP TABLE milscm4.mt_seibunryo_temp;
CREATE TABLE milscm4.mt_seibunryo_temp( 
    yj_code TEXT NOT NULL                       -- ＹＪコード
    , haigozai_f TEXT NOT NULL                  -- 配合剤フラグ
    , seibun_group_code TEXT NOT NULL           -- 成分グループコード
    , seibun_code TEXT NOT NULL                 -- 成分コード
    , seibunryo TEXT                            -- 成分量
    , seibun_unit_code TEXT                     -- 成分単位コード
    , kokuji_kikakuryo TEXT                     -- 告示規格量
    , kokuji_kikaku_unit_code TEXT              -- 告示規格単位コード
    , bikou TEXT                                -- 備考
    , koshin_kubun TEXT NOT NULL                -- 更新区分
    , update_ymd TEXT NOT NULL                  -- データ登録日
); 

ALTER TABLE ONLY milscm4.mt_seibunryo_temp ADD CONSTRAINT mt_seibunryo_temp_pkey PRIMARY KEY (yj_code, seibun_code, koshin_kubun, update_ymd)
; 

GRANT ALL 
    ON TABLE milscm4.mt_seibunryo_temp TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_seibunryo_temp TO pgps2grp1;
