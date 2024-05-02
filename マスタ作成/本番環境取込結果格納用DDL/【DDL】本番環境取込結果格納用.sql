CREATE TABLE milscm4.mt_shisetsu_zokusei_act( 
    facility_id TEXT NOT NULL                   -- �{��ID
    , ippan_bed INTEGER default 0 NOT NULL      -- ��ʕa��
    , seishin_bed INTEGER default 0 NOT NULL    -- ���_�a��
    , kansen_bed INTEGER default 0 NOT NULL     -- �����Ǖa��
    , kekkaku_bed INTEGER default 0 NOT NULL    -- ���j�a��
    , ryouyou_bed INTEGER default 0 NOT NULL    -- �×{�a��
    , univ_hp_f TEXT default '0' NOT NULL       -- ��w�a�@F
    , tokutei_hp_f TEXT default '0' NOT NULL    -- ����@�\�a�@F
    , cancer_hp_f INTEGER default 0 NOT NULL    -- ���񋒓_�a�@F
    , high_acute_care_hp_f TEXT default '0' NOT NULL -- ���x�}�����a�@F
    , acute_care_hp_f TEXT default '0' NOT NULL -- �}�����a�@F
    , mil_exit_f TEXT default '0' NOT NULL      -- ��N�J���e���E�{�݃t���O
    , torikomi_kijun_ym TEXT default '999999' NOT NULL -- �捞��N��
    , update_ymd TEXT default '99999999' NOT NULL -- �f�[�^�o�^�N����
); 

ALTER TABLE ONLY milscm4.mt_shisetsu_zokusei_act ADD CONSTRAINT mt_shisetsu_zokusei_act_pkey PRIMARY
 KEY (facility_id, torikomi_kijun_ym); 

ALTER TABLE milscm4.mt_shisetsu_zokusei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_shisetsu_zokusei_act TO pgappl11; 

CREATE TABLE milscm4.mt_iryouken2_act( 
    iryouken2_cd TEXT NOT NULL                  -- �񎟈�Ì��R�[�h
    , iryouken2 TEXT                            -- �񎟈�Ì�
    , prefecture_cd TEXT NOT NULL               -- �s���{���R�[�h
    , prefecture TEXT NOT NULL                  -- �s���{����
    , city_code TEXT NOT NULL                   -- �s�撬���R�[�h
    , city TEXT NOT NULL                        -- �s�撬��
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , update_ymd TEXT default '99999999' NOT NULL -- �f�[�^�o�^�N����
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt_iryouken2_act ADD CONSTRAINT mt_iryouken2_act_pkey PRIMARY KEY (city_code, update_ymd)
; 

ALTER TABLE milscm4.mt_iryouken2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iryouken2_act TO pgappl11; 

CREATE TABLE milscm4.mt_old_new_iyakuhin_act( 
    siko_ymd TEXT default '99999999' NOT NULL   -- �{�s�N����
    , old_iyakuhin_cd TEXT NOT NULL             -- �����i�R�[�h
    , new_iyakuhin_cd TEXT NOT NULL             -- �V���i�R�[�h
    , update_ymd TEXT default '99999999' NOT NULL -- �f�[�^�o�^�N����
); 

ALTER TABLE ONLY milscm4.mt_old_new_iyakuhin_act ADD CONSTRAINT mt_old_new_iyakuhin_act_pkey PRIMARY
 KEY (siko_ymd, old_iyakuhin_cd, new_iyakuhin_cd); 

ALTER TABLE milscm4.mt_old_new_iyakuhin_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_old_new_iyakuhin_act TO pgappl11; 

CREATE TABLE milscm4.mt_dpc6_icd_act( 
    siko_ymd TEXT default '99999999' NOT NULL   -- �{�s�N����
    , henkou_kubun TEXT NOT NULL                -- �ύX�敪
    , dpc2_cd TEXT NOT NULL                     -- DPC�R�[�h2��
    , dpc6_cd TEXT NOT NULL                     -- DPC�R�[�h6��
    , icd10_cd TEXT NOT NULL                    -- ICD10�R�[�h
    , icd10_name TEXT NOT NULL                  -- ICD��
    , start_ymd TEXT default '00000000' NOT NULL -- �L������_�J�n�N����
    , end_ymd TEXT default '99999999' NOT NULL  -- �L������_�I���N����
    , update_ymd TEXT default '99999999' NOT NULL -- �f�[�^�o�^�N����
); 

ALTER TABLE ONLY milscm4.mt_dpc6_icd_act ADD CONSTRAINT mt_dpc6_icd_act_pkey PRIMARY KEY (icd10_cd, start_ymd)
; 

ALTER TABLE milscm4.mt_dpc6_icd_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_dpc6_icd_act TO pgappl11; 

CREATE TABLE milscm4.mt_syusyokugo_act( 
    henkou_kubun TEXT NOT NULL                  -- �ύX�敪
    , master_type TEXT                          -- �}�X�^�[���
    , syusyokugo_cd TEXT NOT NULL               -- �C����R�[�h
    , reserve1 TEXT                             -- �\��1
    , reserve2 TEXT                             -- �\��2
    , syusyokugo_name_ketasu INTEGER            -- �C���ꖼ�̌���
    , syusyokugo_name TEXT                      -- �C���ꖼ��
    , reserve3 TEXT                             -- �\��3
    , syusyokugo_kana_name_ketasu INTEGER       -- �C����J�i���̌���
    , syusyokugo_kana_name TEXT                 -- �C����J�i����
    , reserve4 TEXT                             -- �\��4
    , syusyokugo_name_henkou TEXT               -- �C���ꖼ�́i�ύX���j
    , syusyokugo_kana_name_henkou TEXT          -- �C����J�i���́i�ύX���j
    , syusai_ymd TEXT                           -- ���ڔN����
    , henko_ymd TEXT                            -- �ύX�N����
    , haishi_ymd TEXT                           -- �p�~�N����
    , syusyokugo_kanri_no INTEGER               -- �C����Ǘ��ԍ�
    , syusyokugo_koukan_cd TEXT                 -- �C��������p�R�[�h
    , syusyokugo_kubun TEXT                     -- �C����敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_syusyokugo_act ADD CONSTRAINT mt_syusyokugo_act_pkey PRIMARY KEY (henkou_kubun, syusyokugo_cd, update_ymd)
; 

ALTER TABLE milscm4.mt_syusyokugo_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_syusyokugo_act TO pgappl11; 

CREATE TABLE milscm4.mt_comment_act( 
    henkou_kubun TEXT NOT NULL                  -- �ύX�敪
    , master_type TEXT NOT NULL                 -- �}�X�^�[���
    , comment_cd TEXT NOT NULL                  -- �R�����g�R�[�h�敪
    , comment_cd_pattern TEXT NOT NULL          -- �R�����g�R�[�h�p�^�[��
    , comment_cd_seq TEXT NOT NULL              -- �R�����g�R�[�h��A�ԍ�
    , comment_sentence_kanji_ketasu INTEGER     -- �R�����g�������L������
    , comment_sentence_kanji_name TEXT          -- �R�����g����������
    , comment_sentence_kana_ketasu INTEGER      -- �R�����g���J�i�L������
    , comment_sentence_kana_name TEXT           -- �R�����g���J�i����
    , recept_hensyu_info1_column_position INTEGER -- ���Z�v�g�ҏW���1�J�����ʒu
    , recept_hensyu_info1_ketasu INTEGER        -- ���Z�v�g�ҏW���1����
    , recept_hensyu_info2_column_position INTEGER -- ���Z�v�g�ҏW���2�J�����ʒu
    , recept_hensyu_info2_ketasu INTEGER        -- ���Z�v�g�ҏW���2����
    , recept_hensyu_info3_column_position INTEGER -- ���Z�v�g�ҏW���3�J�����ʒu
    , recept_hensyu_info3_ketasu INTEGER        -- ���Z�v�g�ҏW���3����
    , recept_hensyu_info4_column_position INTEGER -- ���Z�v�g�ҏW���4�J�����ʒu
    , recept_hensyu_info4_ketasu INTEGER        -- ���Z�v�g�ҏW���4����
    , reserve1 TEXT                             -- �\��1
    , reserve2 TEXT                             -- �\��2
    , selective_comment_identification INTEGER  -- �I�����R�����g����
    , henko_ymd TEXT                            -- �ύX�N����
    , haishi_ymd TEXT                           -- �p�~�N����
    , comment_code TEXT                         -- �R�����g�R�[�h
    , kouhyoujunjo_no TEXT                      -- ���\�����ԍ�
    , reserve3 TEXT                             -- �\��3
    , reserve4 TEXT                             -- �\��4
    , reserve5 TEXT                             -- �\��5
    , reserve6 TEXT                             -- �\��6
    , reserve7 TEXT                             -- �\��7
    , reserve8 TEXT                             -- �\��8
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    yj_code TEXT NOT NULL                       -- �x�i�R�[�h
    , haigozai_f TEXT NOT NULL                  -- �z���܃t���O
    , seibun_group_code TEXT NOT NULL           -- �����O���[�v�R�[�h
    , seibun_code TEXT NOT NULL                 -- �����R�[�h
    , seibunryo NUMERIC                         -- ������
    , seibun_unit_code TEXT                     -- �����P�ʃR�[�h
    , kokuji_kikakuryo NUMERIC                  -- �����K�i��
    , kokuji_kikaku_unit_code TEXT              -- �����K�i�P�ʃR�[�h
    , bikou TEXT                                -- ���l
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_seibunryo_act ADD CONSTRAINT mt_seibunryo_act_pkey PRIMARY KEY (yj_code, seibun_code, koshin_kubun, update_ymd)
; 

ALTER TABLE milscm4.mt_seibunryo_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_seibunryo_act TO pgappl11; 

CREATE TABLE milscm4.mt_seibun_name_act( 
    management_id TEXT NOT NULL                 -- �Ǘ�ID
    , seibun_oya_level TEXT                     -- �����e���x��
    , seibun_oya_code TEXT NOT NULL             -- �����e�R�[�h
    , seibun_code TEXT NOT NULL                 -- �����R�[�h
    , seibun_name TEXT NOT NULL                 -- ������
    , tanmi_f TEXT                              -- �P���t���O
    , haigo_f TEXT                              -- �z���t���O
    , time_stamp TEXT                           -- �^�C���X�^���v
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    unit_code TEXT NOT NULL                     -- �P�ʃR�[�h
    , unit_name TEXT                            -- �P�ʖ���
    , unit_kansan_keisu TEXT                    -- �P�ʊ��Z�W��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_unit_act ADD CONSTRAINT mt_unit_act_pkey PRIMARY KEY (unit_code, koshin_kubun, update_ymd)
; 

ALTER TABLE milscm4.mt_unit_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_unit_act TO pgappl11; 

CREATE TABLE milscm4.mt_tekiyou_recept_combi_link_act( 
    tekiyou_byoumei_link_code TEXT NOT NULL     -- �K�p�a���g�ݍ��킹�R�[�h
    , tekiyou_byoumei_code TEXT NOT NULL        -- �K�p�a���R�[�h
    , shikkan_code TEXT NOT NULL                -- �����R�[�h
    , shikkan_name TEXT                         -- ������
    , haishi_ymd TEXT                           -- �p�~�N����
    , hoken_tekiyougai_f TEXT                   -- �ی��K�p�O�t���O
    , icd10_code TEXT                           -- ICD10
    , kumiawase_code TEXT                       -- �g�ݍ��킹�R�[�h
    , kankeisei_code TEXT                       -- �֌W�����x���R�[�h
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    tekiyou_byoumei_link_code TEXT NOT NULL     -- �K�p�a���g�ݍ��킹�R�[�h
    , yj_code TEXT NOT NULL                     -- �x�i�R�[�h
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    yougo_code1 TEXT                            -- �p��R�[�h�P
    , yougo_code2 TEXT                          -- �p��R�[�h�Q
    , yougo_code3 TEXT                          -- �p��R�[�h�R
    , tekiyou_byoumei_code TEXT NOT NULL        -- �K�p�a���R�[�h
    , tekiyou_byoumei_name TEXT NOT NULL        -- �K�p�a��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_tekiyou_byoumei_act ADD CONSTRAINT mt_tekiyou_byoumei_act_pkey PRIMARY KEY
 (tekiyou_byoumei_code, koshin_kubun, update_ymd); 

ALTER TABLE milscm4.mt_tekiyou_byoumei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_tekiyou_byoumei_act TO pgappl11; 

CREATE TABLE milscm4.mt_yjcode_receptdensancode_link_act( 
    yj_code TEXT                                -- �x�i�R�[�h
    , iyakuhin_code TEXT                        -- ���i�R�[�h
    , iyakuhin_ippan_name TEXT                  -- ���i��ʖ�
    , iyakuhin_name TEXT                        -- ���i��
    , kikaku_naiyou TEXT                        -- �K�i���e
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_yjcode_receptdensancode_link_act ADD CONSTRAINT mt_yjcode_receptdensancode_link_act_pkey
 PRIMARY KEY (yj_code, koshin_kubun, update_ymd); 

ALTER TABLE milscm4.mt_yjcode_receptdensancode_link_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yjcode_receptdensancode_link_act TO pgappl11; 

CREATE TABLE milscm4.mt_shinryo_koi_fuka_act( 
    koshin_kubun TEXT NOT NULL                  -- �X�V�敪
    , master_type TEXT NOT NULL                 -- �}�X�^�[���
    , shinryo_koi_code TEXT NOT NULL            -- �f�Ís�׃R�[�h
    , shinryo_koi_kanji_name_ketasu INTEGER     -- �f�Ís�׏ȗ������L������
    , shinryo_koi_kanji_name TEXT               -- �f�Ís�׏ȗ���������
    , shinryo_koi_kana_name_ketasu INTEGER      -- �f�Ís�׏ȗ��J�i�L������
    , shinryo_koi_kana_name TEXT                -- �f�Ís�׏ȗ��J�i����
    , data_standard_code TEXT                   -- �f�[�^�K�i�R�[�h
    , data_standard_ketasu INTEGER              -- �f�[�^�K�i�����L������
    , data_standard_name TEXT                   -- �f�[�^�K�i��������
    , gen_tensu_shikibetsu INTEGER              -- �V���͌��_������
    , gen_tensu NUMERIC                         -- �V���͌��_��
    , nyugai_tekiyo_kubun TEXT                  -- ���O�K�p�敪
    , aged_tekiyo_kubun TEXT                    -- �������҈�ÓK�p�敪
    , tensuran_shikibetsu_nyuingai TEXT         -- �_�����W�v�掯�ʁi���@�O�j
    , hokatsu_kensa TEXT                        -- ��Ώی���
    , reserve1 TEXT                             -- �\��1
    , dpc_tekiyo_kubun TEXT                     -- DPC�K�p�敪
    , clinic_kubun TEXT                         -- �a�@�E�f�Ï��敪
    , shujutsu_kasan_kubun TEXT                 -- �摜����p�x�����Z�敪
    , iryo_kansatsu_kubun TEXT                  -- ��Êώ@�@�Ώۋ敪
    , kango_kasan TEXT                          -- �Ō���Z
    , masui_shujutsu_kubun TEXT                 -- �������ʋ敪
    , reserve2 TEXT                             -- �\��2
    , shobyo_kanren_kubun TEXT                  -- ���a���֘A�敪
    , reserve3 TEXT                             -- �\��3
    , jitsu_days INTEGER                        -- ������
    , days_times INTEGER                        -- �����E��
    , iyakuhin_kanren_kubun TEXT                -- ���i�֘A�敪
    , kizami_keisan_shikibetsu TEXT             -- �����ݒl�v�Z����
    , kizami_low INTEGER                        -- �����ݒl�����l
    , kizami_up INTEGER                         -- �����ݒl����l
    , kizami_value INTEGER                      -- �����ݒl
    , kizami_tensu NUMERIC                      -- �����ݓ_��
    , up_low_error TEXT                         -- �㉺���G���[����
    , up_times INTEGER                          -- �����
    , up_times_error TEXT                       -- ����񐔃G���[����
    , chu_kasan_code TEXT                       -- �����Z�R�[�h
    , chu_kasan_no TEXT                         -- �����Z�ʔ�
    , tsusoku_age TEXT                          -- �ʑ��N��
    , low_age TEXT                              -- �����N��
    , up_age TEXT                               -- ����N��
    , time_kasan_kubun TEXT                     -- ���ԉ��Z�敪
    , tekigo_kubun TEXT                         -- �K���敪
    , facility_kijun TEXT                       -- �Ώێ{�݊
    , nyuyoji_kasan_kubun TEXT                  -- ���u���c�����Z�敪
    , taijuji_kasan_kubun TEXT                  -- �ɒ�o���̏d�����Z�敪
    , nyuin_kihon_gensan_shikibetsu TEXT        -- ���@��{�������Z�Ώێ���
    , donor_kubun TEXT                          -- �h�i�[���W�v�敪
    , kensa_handan_kubun TEXT                   -- ���������{���f�敪
    , kensa_handan_group_kubun TEXT             -- ���������{���f�O���[�v�敪
    , teigen_kubun TEXT                         -- �����Ώۋ敪
    , sekizui_kasan_kubun TEXT                  -- �Ґ��U���d�ʑ��蓙���Z�敪
    , keibu_kasan_kubun TEXT                    -- �򕔊s���p���{���Z�敪
    , hogoki_kasan_kubun TEXT                   -- �����D������Z�敪
    , gairai_kasan_kubun TEXT                   -- �O���Ǘ����Z�敪
    , old_tensu_shikibetsu TEXT                 -- ���_������
    , old_tensu NUMERIC                         -- ���_��
    , kanji_henko_kubun TEXT                    -- �������̕ύX�敪
    , kana_henko_kubun TEXT                     -- �J�i���̕ύX�敪
    , kentai_comment TEXT                       -- ���̌����R�����g
    , tsusoku_kasan_tensu TEXT                  -- �ʑ����Z����_���Ώۋ敪
    , hokatsu_teigen_kubun TEXT                 -- ������敪
    , choonpa_naishikyo_kasan_kubun TEXT        -- �����g���������Z�敪
    , reserve4 TEXT                             -- �\��4
    , tensuran_shikibetsu_nyuin TEXT            -- �_�����W�v�掯�ʁi���@�j
    , fungoki_kasan_kubun TEXT                  -- ������������Z�敪
    , kokuji_shikibetsu_kubun1 TEXT             -- ���������ʋ敪1
    , kokuji_shikibetsu_kubun2 TEXT             -- ���������ʋ敪2
    , chiiki_kasan TEXT                         -- �n����Z
    , bed_su_kubun TEXT                         -- �a�����敪
    , facility_kijun_code1 TEXT                 -- �{�݊�R�[�h1
    , facility_kijun_code2 TEXT                 -- �{�݊�R�[�h2
    , facility_kijun_code3 TEXT                 -- �{�݊�R�[�h3
    , facility_kijun_code4 TEXT                 -- �{�݊�R�[�h4
    , facility_kijun_code5 TEXT                 -- �{�݊�R�[�h5
    , facility_kijun_code6 TEXT                 -- �{�݊�R�[�h6
    , facility_kijun_code7 TEXT                 -- �{�݊�R�[�h7
    , facility_kijun_code8 TEXT                 -- �{�݊�R�[�h8
    , facility_kijun_code9 TEXT                 -- �{�݊�R�[�h9
    , facility_kijun_code10 TEXT                -- �{�݊�R�[�h10
    , choonpa_sekkai_kasan_kubun TEXT           -- �����g�ÌŐ؊J���u�����Z�敪
    , tanki_shujutsu TEXT                       -- �Z���؍ݎ�p
    , shika_tekiyo_kubun TEXT                   -- ���ȓK�p�敪
    , code_table_alphabet TEXT                  -- �R�[�h�\�p�ԍ��i�A���t�@�x�b�g���j
    , kokuji_kanren_no_alphabet TEXT            -- �����E�ʒm�֘A�ԍ��i�A���t�@�x�b�g���j
    , henko_ymd TEXT                            -- �ύX�N����
    , haishi_ymd TEXT                           -- �p�~�N����
    , kohyo_junjo_no TEXT                       -- ���\�����ԍ�
    , code_table_no_sho TEXT                    -- �R�[�h�\�p�ԍ�_��
    , code_table_no_bu TEXT                     -- �R�[�h�\�p�ԍ�_��
    , code_table_no_kubun TEXT                  -- �R�[�h�\�p�ԍ�_�敪�ԍ�
    , code_table_no_edaban TEXT                 -- �R�[�h�\�p�ԍ�_�}��
    , code_table_no_koban TEXT                  -- �R�[�h�\�p�ԍ�_����
    , kokuji_kanren_no_sho TEXT                 -- �����E�ʒm�֘A�ԍ�_��
    , kokuji_kanren_no_bu TEXT                  -- �����E�ʒm�֘A�ԍ�_��
    , kokuji_kanren_no_kubun TEXT               -- �����E�ʒm�֘A�ԍ�_�敪�ԍ�
    , kokuji_kanren_no_edaban TEXT              -- �����E�ʒm�֘A�ԍ�_�}��
    , kokuji_kanren_no_koban TEXT               -- �����E�ʒm�֘A�ԍ�_����
    , age1_kasan_low TEXT                       -- �N����Z1�����N��
    , age1_kasan_up TEXT                        -- �N����Z1����N��
    , age1_kasan_koi_code TEXT                  -- �N����Z1�����Z�f�Ís�׃R�[�h
    , age2_kasan_low TEXT                       -- �N����Z2�����N��
    , age2_kasan_up TEXT                        -- �N����Z2����N��
    , age2_kasan_koi_code TEXT                  -- �N����Z2�����Z�f�Ís�׃R�[�h
    , age3_kasan_low TEXT                       -- �N����Z3�����N��
    , age3_kasan_up TEXT                        -- �N����Z3����N��
    , age3_kasan_koi_code TEXT                  -- �N����Z3�����Z�f�Ís�׃R�[�h
    , age4_kasan_low TEXT                       -- �N����Z4�����N��
    , age4_kasan_up TEXT                        -- �N����Z4����N��
    , age4_kasan_koi_code TEXT                  -- �N����Z4�����Z�f�Ís�׃R�[�h
    , ido_kanren TEXT                           -- �ٓ��֘A
    , kihon_kanji_name TEXT                     -- ��{��������
    , fukubiko_naishikyo_kasan TEXT             -- ���@�o��p�p���������Z
    , fukubiko_kotsunanbu_kasan TEXT            -- ���@�o��p�p����g�D�؏��@����Z
    , long_masui_kasan TEXT                     -- �����Ԗ����Ǘ����Z
    , tensu_kubun_no TEXT                       -- �_���\�敪�ԍ�
    , monitoring_kasan TEXT                     -- ���j�^�����O���Z
    , toketsu_hozon_kasan TEXT                  -- �����ۑ�����g�D���Z
    , akusei_shuyo_kasan TEXT                   -- ������ᇕa���g�D�W�{���Z
    , sogai_kotei_kasan TEXT                    -- �n�O�Œ����Z
    , chouonpa_sessaku_kasan TEXT               -- �����g�؍�@����Z
    , sashin_jiheisa_kasan TEXT                 -- ���S�����p���{���Z
    , gairai_kansen_taisaku_koujo_kubun TEXT    -- �O�������΍������Z��
    , jibi_inko_nyuyoji_kasan TEXT              -- ���@��A�ȓ��c�����u���Z
    , jibi_inko_shoni_koukin_tekisei_shiyou_shien_kasan TEXT -- ���@��A�ȏ����R�ۖ�K���g�p�x�����Z
    , sekkaisou_kyokusho_inatsu_heisa_shochi_kasan TEXT -- �؊J�n�Ǐ��A�������u�@����Z
    , reserve5 TEXT                             -- �\��5
    , reserve6 TEXT                             -- �\��6
    , reserve7 TEXT                             -- �\��7
    , reserve8 TEXT                             -- �\��8
    , reserve9 TEXT                             -- �\��9
    , reserve10 TEXT                            -- �\��10
    , reserve11 TEXT                            -- �\��11
    , reserve12 TEXT                            -- �\��12
    , reserve13 TEXT                            -- �\��13
    , reserve14 TEXT                            -- �\��14
    , reserve15 TEXT                            -- �\��15
    , reserve16 TEXT                            -- �\��16
    , reserve17 TEXT                            -- �\��17
    , reserve18 TEXT                            -- �\��18
    , reserve19 TEXT                            -- �\��19
    , reserve20 TEXT                            -- �\��20
    , reserve21 TEXT                            -- �\��21
    , reserve22 TEXT                            -- �\��22
    , reserve23 TEXT                            -- �\��23
    , reserve24 TEXT                            -- �\��24
    , reserve25 TEXT                            -- �\��25
    , reserve26 TEXT                            -- �\��26
    , reserve27 TEXT                            -- �\��27
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_shinryo_koi_fuka_act ADD CONSTRAINT mt_shinryo_koi_fuka_act_pkey PRIMARY
 KEY (koshin_kubun, shinryo_koi_code, update_ymd); 

ALTER TABLE milscm4.mt_shinryo_koi_fuka_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_shinryo_koi_fuka_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , iyakuhin_code TEXT NOT NULL               -- ���i�R�[�h
    , yakko_bunrui1_code TEXT NOT NULL          -- �������1�R�[�h
    , yakko_bunrui2_code TEXT NOT NULL          -- �������2�R�[�h
    , yakko_bunrui3_code TEXT NOT NULL          -- �������3�R�[�h
    , yakko_bunrui4_code TEXT NOT NULL          -- �������4�R�[�h
    , yakko_bunrui5_code TEXT NOT NULL          -- �������5�R�[�h
    , seizo_maker_code TEXT NOT NULL            -- �������[�J�R�[�h
    , iyakuhin_name TEXT NOT NULL               -- ���i��
    , iyakuhin_jpn_name TEXT NOT NULL           -- ���i���{�ꖼ
    , kohatsuhin_flag TEXT NOT NULL             -- �㔭�i�t���O
    , shinyaku_code TEXT                        -- �V��R�[�h
    , iyakuhin_brand_code TEXT NOT NULL         -- ���i�u�����h�R�[�h
    , iyakuhin_ippan_name_code TEXT NOT NULL    -- ���i��ʖ��R�[�h
    , toyo_keiro_kubun TEXT NOT NULL            -- ���^�o�H�敪
    , tokutei_kizai_unit_code TEXT              -- �����ޒP�ʃR�[�h
    , hatsubai_ymd TEXT NOT NULL                -- �����N����
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_act ADD CONSTRAINT mt_iyakuhin_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, iyakuhin_code)
; 

ALTER TABLE milscm4.mt_iyakuhin_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_brand_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , iyakuhin_brand_code TEXT NOT NULL         -- ���i�u�����h�R�[�h
    , iyakuhin_brand_name TEXT NOT NULL         -- ���i�u�����h��
    , iyakuhin_brand_jpn_name TEXT NOT NULL     -- ���i�u�����h���{�ꖼ
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_brand_act ADD CONSTRAINT mt_iyakuhin_brand_act_pkey PRIMARY KEY
 (sekoubi, koshin_kubun, iyakuhin_brand_code); 

ALTER TABLE milscm4.mt_iyakuhin_brand_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_brand_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_ippan_name_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , iyakuhin_ippan_name_code TEXT NOT NULL    -- ���i��ʖ��R�[�h
    , iyakuhin_ippan_name TEXT NOT NULL         -- ���i��ʖ�
    , iyakuhin_ippan_englishname TEXT NOT NULL  -- ���i��ʖ��p��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_iyakuhin_ippan_name_act ADD CONSTRAINT mt_iyakuhin_ippan_name_act_pkey PRIMARY
 KEY (sekoubi, koshin_kubun, iyakuhin_ippan_name_code); 

ALTER TABLE milscm4.mt_iyakuhin_ippan_name_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_iyakuhin_ippan_name_act TO pgappl11; 

CREATE TABLE milscm4.mt_iyakuhin_sales_kaisha_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , iyakuhin_code TEXT NOT NULL               -- ���i�R�[�h
    , maker_code TEXT NOT NULL                  -- ���[�J�R�[�h
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , maker_code TEXT NOT NULL                  -- ���[�J�R�[�h
    , maker_name TEXT NOT NULL                  -- ���[�J��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_maker_act ADD CONSTRAINT mt_maker_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, maker_code)
; 

ALTER TABLE milscm4.mt_maker_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_maker_act TO pgappl11; 

CREATE TABLE milscm4.mt_price_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , iyakuhin_code TEXT NOT NULL               -- ���i�R�[�h
    , nendo TEXT NOT NULL                       -- �N�x
    , price NUMERIC NOT NULL                    -- ��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_price_act ADD CONSTRAINT mt_price_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, iyakuhin_code)
; 

ALTER TABLE milscm4.mt_price_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_price_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc1_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , yakko_bunrui1_code TEXT NOT NULL          -- �������1�R�[�h
    , yakko_bunrui1_name TEXT NOT NULL          -- �������1��
    , yakko_bunrui1_jpn_name TEXT NOT NULL      -- �������1���{�ꖼ
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_yakko_atc1_act ADD CONSTRAINT mt_yakko_atc1_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, yakko_bunrui1_code)
; 

ALTER TABLE milscm4.mt_yakko_atc1_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_yakko_atc1_act TO pgappl11; 

CREATE TABLE milscm4.mt_yakko_atc2_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , yakko_bunrui1_code TEXT NOT NULL          -- �������1�R�[�h
    , yakko_bunrui2_code TEXT NOT NULL          -- �������2�R�[�h
    , yakko_bunrui2_name TEXT NOT NULL          -- �������2��
    , yakko_bunrui2_jpn_name TEXT NOT NULL      -- �������2���{�ꖼ
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , yakko_bunrui1_code TEXT NOT NULL          -- �������1�R�[�h
    , yakko_bunrui2_code TEXT NOT NULL          -- �������2�R�[�h
    , yakko_bunrui3_code TEXT NOT NULL          -- �������3�R�[�h
    , yakko_bunrui3_name TEXT NOT NULL          -- �������3��
    , yakko_bunrui3_jpn_name TEXT NOT NULL      -- �������3���{�ꖼ
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , yakko_bunrui1_code TEXT NOT NULL          -- �������1�R�[�h
    , yakko_bunrui2_code TEXT NOT NULL          -- �������2�R�[�h
    , yakko_bunrui3_code TEXT NOT NULL          -- �������3�R�[�h
    , yakko_bunrui4_code TEXT NOT NULL          -- �������4�R�[�h
    , yakko_bunrui4_name TEXT NOT NULL          -- �������4��
    , yakko_bunrui4_jpn_name TEXT NOT NULL      -- �������4���{�ꖼ
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , yakko_bunrui1_code TEXT NOT NULL          -- �������1�R�[�h
    , yakko_bunrui2_code TEXT NOT NULL          -- �������2�R�[�h
    , yakko_bunrui3_code TEXT NOT NULL          -- �������3�R�[�h
    , yakko_bunrui4_code TEXT NOT NULL          -- �������4�R�[�h
    , yakko_bunrui5_code TEXT NOT NULL          -- �������5�R�[�h
    , yakko_bunrui5_name TEXT NOT NULL          -- �������5��
    , yakko_bunrui5_jpn_name TEXT NOT NULL      -- �������5���{�ꖼ
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
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
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , shippei_code TEXT NOT NULL                -- ���a�R�[�h
    , icd10_1_l_code TEXT                       -- ICD10-1�啪�ރR�[�h
    , icd10_1_m_code TEXT                       -- ICD10-1�����ރR�[�h
    , icd10_1_s_code TEXT                       -- ICD10-1�����ރR�[�h
    , icd10_1_ss_code TEXT                      -- ICD10-1�ו��ރR�[�h
    , icd10_2_l_code TEXT                       -- ICD10-2�啪�ރR�[�h
    , icd10_2_m_code TEXT                       -- ICD10-2�����ރR�[�h
    , icd10_2_s_code TEXT                       -- ICD10-2�����ރR�[�h
    , icd10_2_ss_code TEXT                      -- ICD10-2�ו��ރR�[�h
    , shippei_name TEXT NOT NULL                -- ���a��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_shippei_act ADD CONSTRAINT mt_shippei_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, shippei_code)
; 

ALTER TABLE milscm4.mt_shippei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_shippei_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_l_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , icd10_l_code TEXT NOT NULL                -- ICD10�啪�ރR�[�h
    , icd10_l_name TEXT NOT NULL                -- ICD10�啪�ޖ�
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_icd10_l_act ADD CONSTRAINT mt_icd10_l_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_l_code)
; 

ALTER TABLE milscm4.mt_icd10_l_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_l_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_m_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , icd10_m_code TEXT NOT NULL                -- ICD10�����ރR�[�h
    , icd10_m_name TEXT NOT NULL                -- ICD10�����ޖ�
    , icd10_l_code TEXT NOT NULL                -- ICD10�啪�ރR�[�h
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_icd10_m_act ADD CONSTRAINT mt_icd10_m_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_m_code)
; 

ALTER TABLE milscm4.mt_icd10_m_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_m_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_s_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , icd10_s_code TEXT NOT NULL                -- ICD10�����ރR�[�h
    , icd10_s_name TEXT NOT NULL                -- ICD10�����ޖ�
    , icd10_l_code TEXT NOT NULL                -- ICD10�啪�ރR�[�h
    , icd10_m_code TEXT NOT NULL                -- ICD10�����ރR�[�h
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_icd10_s_act ADD CONSTRAINT mt_icd10_s_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_s_code)
; 

ALTER TABLE milscm4.mt_icd10_s_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_s_act TO pgappl11; 

CREATE TABLE milscm4.mt_icd10_ss_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , icd10_ss_code TEXT NOT NULL               -- ICD10�ו��ރR�[�h
    , icd10_ss_name TEXT NOT NULL               -- ICD10�ו��ޖ�
    , icd10_l_code TEXT NOT NULL                -- ICD10�啪�ރR�[�h
    , icd10_m_code TEXT NOT NULL                -- ICD10�����ރR�[�h
    , icd10_s_code TEXT NOT NULL                -- ICD10�����ރR�[�h
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_icd10_ss_act ADD CONSTRAINT mt_icd10_ss_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, icd10_ss_code)
; 

ALTER TABLE milscm4.mt_icd10_ss_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_icd10_ss_act TO pgappl11; 

CREATE TABLE milscm4.mt_dpc2_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , henkou_kubun TEXT NOT NULL                -- �ύX�敪
    , dpc2_code TEXT NOT NULL                   -- DPC�R�[�h2��
    , dpc2_name TEXT NOT NULL                   -- DPC2����
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_dpc2_act ADD CONSTRAINT mt_dpc2_act_pkey PRIMARY KEY (sekoubi, dpc2_code)
; 

ALTER TABLE milscm4.mt_dpc2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_dpc2_act TO pgappl11; 

CREATE TABLE milscm4.mt_dpc6_act( 
    sekoubi TEXT NOT NULL                       -- �{�s��
    , henkou_kubun TEXT NOT NULL                -- �ύX�敪
    , dpc2_code TEXT NOT NULL                   -- DPC�R�[�h2��
    , dpc4_code TEXT NOT NULL                   -- DPC�R�[�h4��
    , dpc6_name TEXT NOT NULL                   -- DPC6����
    , ikosaki TEXT                              -- �ڍs��
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_dpc6_act ADD CONSTRAINT mt_dpc6_act_pkey PRIMARY KEY (sekoubi, dpc2_code, dpc4_code)
; 

ALTER TABLE milscm4.mt_dpc6_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_dpc6_act TO pgappl11; 

CREATE TABLE milscm4.mt_postal_act( 
    koshin_kubun TEXT NOT NULL                  -- �X�V�敪
    , postal_code TEXT NOT NULL                 -- �X�֔ԍ�
    , prefecture_code TEXT NOT NULL             -- �s���{���R�[�h
    , city_code TEXT NOT NULL                   -- �s�撬���R�[�h
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
    sekoubi TEXT NOT NULL                       -- �{�s��
    , koshin_kubun TEXT NOT NULL                -- �X�V�敪
    , tokutei_kizai_cd TEXT NOT NULL            -- �����ރR�[�h
    , tokutei_kizai_name TEXT NOT NULL          -- �����ޖ��E�K�i��
    , tokutei_kizai_tani TEXT                   -- �P��
    , tokutei_kizai_kingaku NUMERIC NOT NULL    -- ���z
    , nen TEXT NOT NULL                         -- �N
    , nengetsu TEXT NOT NULL                    -- �N��
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
); 

ALTER TABLE ONLY milscm4.mt_tokutei_kizai_act ADD CONSTRAINT mt_tokutei_kizai_act_pkey PRIMARY KEY (sekoubi, koshin_kubun, tokutei_kizai_cd)
; 

ALTER TABLE milscm4.mt_tokutei_kizai_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt_tokutei_kizai_act TO pgappl11; 

CREATE TABLE milscm4.mt2_shisetsu_zokusei_act( 
    facility_id TEXT NOT NULL                   -- �{��ID
    , kijun_ym TEXT default '999999' NOT NULL   -- ��N��
    , facility_name TEXT NOT NULL               -- �{�ݖ�
    , opt_out_ymd TEXT                          -- �ʒm�J�n�N����
    , prefecture_cd TEXT NOT NULL               -- �s���{���R�[�h
    , prefecture TEXT NOT NULL                  -- �s���{����
    , region_cd TEXT NOT NULL                   -- �n���R�[�h
    , region TEXT NOT NULL                      -- �n����
    , city_cd TEXT NOT NULL                     -- �s�撬���R�[�h
    , city TEXT NOT NULL                        -- �s�撬��
    , address TEXT NOT NULL                     -- �Z��
    , iryouken2_cd TEXT NOT NULL                -- �񎟈�Ì��R�[�h
    , iryouken2 TEXT NOT NULL                   -- �񎟈�Ì�
    , ippan_bed INTEGER                         -- ��ʕa��
    , seishin_bed INTEGER                       -- ���_�a��
    , kansen_bed INTEGER                        -- �����Ǖa��
    , kekkaku_bed INTEGER                       -- ���j�a��
    , ryouyou_bed INTEGER                       -- �×{�a��
    , all_bed INTEGER                           -- ���a����
    , univ_hp_f TEXT                            -- ��w�a�@F
    , tokutei_hp_f TEXT                         -- ����@�\�a�@F
    , cancer_hp_f INTEGER                       -- ���񋒓_�a�@F
    , high_Acute_care_hp_f TEXT                 -- ���x�}�����a�@F
    , Acute_care_hp_f TEXT                      -- �}�����a�@F
    , mil_exit_f TEXT                           -- ��N�J���e���E�{�݃t���O
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
    , shisetsu_update_ymd TEXT default '99999999' NOT NULL -- �{�݃}�X�^�f�[�^�o�^��
    , zokusei_update_ymd TEXT                   -- �{�ݑ����}�X�^�捞�p�f�[�^�o�^��
    , zokusei_torikomi_kijun_ym TEXT            -- �{�ݑ����}�X�^�捞�p�捞��N��
    , mainte_f TEXT default '0' NOT NULL        -- �����e�i���X�t���O
); 

ALTER TABLE ONLY milscm4.mt2_shisetsu_zokusei_act ADD CONSTRAINT mt2_shisetsu_zokusei_act_pkey PRIMARY
 KEY (facility_id, kijun_ym); 

ALTER TABLE milscm4.mt2_shisetsu_zokusei_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_shisetsu_zokusei_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iryouken2_act( 
    iryouken2_cd TEXT NOT NULL                  -- �񎟈�Ì��R�[�h
    , iryouken2 TEXT NOT NULL                   -- �񎟈�Ì�
    , prefecture_cd TEXT NOT NULL               -- �s���{���R�[�h
    , city_code TEXT NOT NULL                   -- �s�撬���R�[�h
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_iryouken2_act ADD CONSTRAINT mt2_iryouken2_act_pkey PRIMARY KEY (city_code, henkou_ymd, del_ymd)
; 

ALTER TABLE milscm4.mt2_iryouken2_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iryouken2_act TO pgappl11; 

CREATE TABLE milscm4.mt2_old_new_shisetsu_act( 
    old_facility_id TEXT NOT NULL               -- ���{��ID
    , new_facility_id TEXT NOT NULL             -- �V�{��ID
    , start_ymd TEXT default '99999999' NOT NULL -- �K�p�J�n��
); 

ALTER TABLE ONLY milscm4.mt2_old_new_shisetsu_act ADD CONSTRAINT mt2_old_new_shisetsu_act_pkey PRIMARY
 KEY (old_facility_id); 

ALTER TABLE milscm4.mt2_old_new_shisetsu_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_old_new_shisetsu_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iyakuhin_kanren_act( 
    iyakuhin_cd TEXT NOT NULL                   -- ���i�R�[�h
    , iyakuhin_brand_cd TEXT NOT NULL           -- ���i�u�����h�R�[�h
    , iyakuhin_ippan_name_cd TEXT NOT NULL      -- ���i��ʖ��R�[�h
    , yakko_bunrui1_cd TEXT NOT NULL            -- �������1�R�[�h
    , yakko_bunrui2_cd TEXT NOT NULL            -- �������2�R�[�h
    , yakko_bunrui3_cd TEXT NOT NULL            -- �������3�R�[�h
    , yakko_bunrui4_cd TEXT NOT NULL            -- �������4�R�[�h
    , yakko_bunrui5_cd TEXT NOT NULL            -- �������5�R�[�h
    , seizo_maker_cd TEXT                       -- �������[�J�R�[�h
    , iyakuhin_jpn_name TEXT NOT NULL           -- ���i���{�ꖼ
    , iyakuhin_brand_jpn_name TEXT NOT NULL     -- ���i�u�����h��
    , iyakuhin_ippan_name TEXT NOT NULL         -- ���i��ʖ�
    , iyakuhin_name TEXT NOT NULL               -- ���i��ʖ��p��
    , yakko_bunrui1_jpn_name TEXT NOT NULL      -- �������1��
    , yakko_bunrui2_jpn_name TEXT NOT NULL      -- �������2��
    , yakko_bunrui3_jpn_name TEXT NOT NULL      -- �������3��
    , yakko_bunrui4_jpn_name TEXT NOT NULL      -- �������4��
    , yakko_bunrui5_jpn_name TEXT NOT NULL      -- �������5��
    , seizo_maker_name TEXT                     -- �������[�J��
    , kohatsuhin_f TEXT default '0' NOT NULL    -- �㔭�i�t���O
    , toyo_keiro_kubun TEXT NOT NULL            -- ���^�o�H�敪
    , yakkasyusai_ymd TEXT default '99999999' NOT NULL -- �{�s�N����
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_iyakuhin_kanren_act ADD CONSTRAINT mt2_iyakuhin_kanren_act_pkey PRIMARY
 KEY (iyakuhin_cd, yakkasyusai_ymd); 

ALTER TABLE milscm4.mt2_iyakuhin_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iyakuhin_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_price_kanren_act( 
    iyakuhin_code TEXT NOT NULL                 -- ���i�R�[�h
    , price NUMERIC NOT NULL                    -- ��
    , yakkasyusai_ymd TEXT default '99999999' NOT NULL -- �{�s�N����
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_price_kanren_act ADD CONSTRAINT mt2_price_kanren_act_pkey PRIMARY KEY (iyakuhin_code, yakkasyusai_ymd)
; 

ALTER TABLE milscm4.mt2_price_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_price_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_shinryo_koi_kanren_act( 
    shinryo_koi_cd TEXT NOT NULL                -- �f�Ís�׃R�[�h
    , cd_no TEXT                                -- �A���t�@�x�b�g�R�[�h
    , cd_no_kubun TEXT                          -- �敪�ԍ�
    , cd_no_eda TEXT                            -- �}��
    , cd_no_koh TEXT                            -- ����
    , kubun_no TEXT                             -- �_���\�敪�ԍ�
    , point NUMERIC NOT NULL                    -- �_��
    , shinryo_koi_name TEXT NOT NULL            -- �f�Ís�׏ȗ���
    , shinryo_koi_kihonname TEXT NOT NULL       -- �f�Ís�ז�
    , update_ymd TEXT NOT NULL                  -- �f�[�^�o�^��
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_shinryo_koi_kanren_act ADD CONSTRAINT mt2_shinryo_koi_kanren_act_pkey PRIMARY
 KEY (shinryo_koi_cd, update_ymd); 

ALTER TABLE milscm4.mt2_shinryo_koi_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_shinryo_koi_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_tokutei_kizai_kanren_act( 
    tokutei_kizai_cd TEXT NOT NULL              -- �����ރR�[�h
    , tokutei_kizai_name TEXT NOT NULL          -- �����ޖ��E�K�i��
    , tokutei_kizai_tani TEXT                   -- �P��
    , price NUMERIC NOT NULL                    -- ���z
    , siko_ymd TEXT default '99999999' NOT NULL -- �{�s�N����
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_tokutei_kizai_kanren_act ADD CONSTRAINT mt2_tokutei_kizai_kanren_act_pkey
 PRIMARY KEY (tokutei_kizai_cd, siko_ymd); 

ALTER TABLE milscm4.mt2_tokutei_kizai_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_tokutei_kizai_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_dpc_kanren_act( 
    dpc2_cd TEXT NOT NULL                       -- DPC�R�[�h2��
    , dpc2_name TEXT NOT NULL                   -- DPC2����
    , dpc6_cd TEXT NOT NULL                     -- DPC�R�[�h6��
    , dpc6_name TEXT NOT NULL                   -- DPC6����
    , siko_ymd TEXT default '99999999' NOT NULL -- �{�s�N����
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_dpc_kanren_act ADD CONSTRAINT mt2_dpc_kanren_act_pkey PRIMARY KEY (dpc6_cd, siko_ymd)
; 

ALTER TABLE milscm4.mt2_dpc_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_dpc_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_shikkan_kanren_act( 
    shikkan_cd TEXT NOT NULL                    -- �����R�[�h
    , icd10_l_cd TEXT                           -- ICD10�啪�ރR�[�h
    , icd10_m_cd TEXT                           -- ICD10�����ރR�[�h
    , icd10_s_cd TEXT                           -- ICD10�����ރR�[�h
    , icd10_ss_cd TEXT                          -- ICD10�ו��ރR�[�h
    , shikkan_name TEXT NOT NULL                -- ������
    , icd10_l_name TEXT                         -- ICD10�啪�ޖ�
    , icd10_m_name TEXT                         -- ICD10�����ޖ�
    , icd10_s_name TEXT                         -- ICD10�����ޖ�
    , icd10_ss_name TEXT                        -- ICD10�ו��ޖ�
    , icd10_kubun TEXT default '0'              -- ICD10�敪
    , siko_ymd TEXT default '99999999' NOT NULL -- �{�s�N����
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_shikkan_kanren_act ADD CONSTRAINT mt2_shikkan_kanren_act_pkey PRIMARY KEY
 (shikkan_cd, icd10_kubun, siko_ymd); 

ALTER TABLE milscm4.mt2_shikkan_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_shikkan_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iyakuhin_seibun_kanren_act( 
    yj_cd TEXT NOT NULL                         -- �x�i�R�[�h
    , iyakuhin_cd TEXT                          -- ���i�R�[�h
    , iyakuhin_name TEXT                        -- ���i��
    , haigozai_f TEXT NOT NULL                  -- �z���܃t���O
    , seibun_group_cd TEXT NOT NULL             -- �����O���[�v�R�[�h
    , seibun_cd TEXT NOT NULL                   -- �����R�[�h
    , seibun_name TEXT NOT NULL                 -- ������
    , seibunryo NUMERIC                         -- ������
    , seibun_unit_cd TEXT                       -- �����P�ʃR�[�h
    , seibun_unit_name TEXT                     -- �����P�ʖ���
    , kokuji_kikakuryo NUMERIC                  -- �����K�i��
    , kokuji_kikaku_unit_cd TEXT                -- �����K�i�P�ʃR�[�h
    , kokuji_kikaku_unit_name TEXT              -- �����K�i�P�ʖ���
    , kikaku_naiyou TEXT                        -- �K�i���e
    , bikou TEXT                                -- ���l
    , update_ymd TEXT default '99999999' NOT NULL -- �f�[�^�o�^��
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
); 

ALTER TABLE ONLY milscm4.mt2_iyakuhin_seibun_kanren_act ADD CONSTRAINT mt2_iyakuhin_seibun_kanren_act_pkey
 PRIMARY KEY (yj_cd, seibun_cd, update_ymd); 

ALTER TABLE milscm4.mt2_iyakuhin_seibun_kanren_act OWNER TO pgmisgrp1; 

GRANT ALL 
    ON TABLE milscm4.mt2_iyakuhin_seibun_kanren_act TO pgappl11; 

CREATE TABLE milscm4.mt2_iyakuhin_tekiyou_byomei_kanren_act( 
    yj_cd TEXT NOT NULL                         -- �x�i�R�[�h
    , iyakuhin_cd TEXT                          -- ���i�R�[�h
    , iyakuhin_name TEXT                        -- ���i��
    , tekiyou_byoumei_cd TEXT NOT NULL          -- �K�p�a���R�[�h
    , tekiyou_byoumei_name TEXT NOT NULL        -- �K�p�a��
    , shikkan_cd TEXT NOT NULL                  -- �����R�[�h
    , shikkan_name TEXT                         -- ������
    , kumiawase_cd TEXT                         -- �g�ݍ��킹�R�[�h
    , kankeisei_cd TEXT                         -- �֌W�����x���R�[�h
    , update_ymd TEXT default '99999999' NOT NULL -- �f�[�^�o�^��
    , new_f TEXT default '0' NOT NULL           -- �ŐV�t���O
    , del_f TEXT default '0' NOT NULL           -- �폜�t���O
    , henkou_ymd TEXT default '99999999' NOT NULL -- �ύX�N����
    , del_ymd TEXT default '99999999' NOT NULL  -- �p�~�N����
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
