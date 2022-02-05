CREATE TABLE tbl_patient_202004(
	p_no CHAR(4) NOT NULL,
    p_name VARCHAR(20),
    p_birth CHAR(8),
    p_gender CHAR(1),
    p_tel1 CHAR(3),
    p_tel2 CHAR(4),
    p_tel3 CHAR(4),
    p_city CHAR(2),
    CONSTRAINT patient_pk PRIMARY KEY(p_no)
    );
    
CREATE TABLE tbl_lab_test_202004(
	t_code CHAR(4) NOT NULL,
    t_name VARCHAR(20),
    CONSTRAINT test_pk PRIMARY KEY(t_code)
    );
    
CREATE TABLE tbl_result_202004(
	p_no CHAR(4) NOT NULL,
    t_code CHAR(4),
    t_sdate DATE,
    t_status CHAR(1),
    t_ldate DATE,
    t_result CHAR(1),
    CONSTRAINT result_pk PRIMARY KEY(p_no,t_code,t_sdate)
    );
    
    
INSERT INTO tbl_patient_202004 VALUES('1001','김환자','19850301','M','010','2222','0001','10');
INSERT INTO tbl_patient_202004 VALUES('1002','이환자','19900301','M','010','2222','0002','20');
INSERT INTO tbl_patient_202004 VALUES('1003','박환자','19770301','F','010','2222','0003','30');
INSERT INTO tbl_patient_202004 VALUES('1004','조환자','19650301','F','010','2222','0004','10');
INSERT INTO tbl_patient_202004 VALUES('1005','황환자','19400301','M','010','2222','0005','40');
INSERT INTO tbl_patient_202004 VALUES('1006','양환자','19440301','F','010','2222','0006','40');
INSERT INTO tbl_patient_202004 VALUES('1007','허환자','19760301','F','010','2222','0007','10');


INSERT INTO tbl_lab_test_202004 VALUES('T001','결핵');
INSERT INTO tbl_lab_test_202004 VALUES('T002','장티푸스');
INSERT INTO tbl_lab_test_202004 VALUES('T003','수두');
INSERT INTO tbl_lab_test_202004 VALUES('T004','홍역');
INSERT INTO tbl_lab_test_202004 VALUES('T005','콜레라');

INSERT INTO tbl_result_202004 VALUES('1001','T001','2020-01-01','1','2020-01-02','X');
INSERT INTO tbl_result_202004 VALUES('1002','T002','2020-01-01','2','2020-01-02','P');
INSERT INTO tbl_result_202004 VALUES('1003','T003','2020-01-01','2','2020-01-02','N');
INSERT INTO tbl_result_202004 VALUES('1004','T004','2020-01-01','2','2020-01-02','P');
INSERT INTO tbl_result_202004 VALUES('1005','T005','2020-01-01','2','2020-01-02','P');
INSERT INTO tbl_result_202004 VALUES('1006','T001','2020-01-01','2','2020-01-02','N');
INSERT INTO tbl_result_202004 VALUES('1007','T002','2020-01-01','2','2020-01-02','P');
INSERT INTO tbl_result_202004 VALUES('1005','T003','2020-01-01','2','2020-01-02','P');
INSERT INTO tbl_result_202004 VALUES('1006','T004','2020-01-01','2','2020-01-02','N');
INSERT INTO tbl_result_202004 VALUES('1007','T005','2020-01-01','2','2020-01-02','N');

SELECT*FROM tbl_patient_202004;
SELECT*FROM tbl_lab_test_202004;
SELECT*FROM tbl_result_202004;