


-- INSERT G_ORGAN_TB (Without PK)
INSERT INTO GUARD.G_ORGAN_TB
(organ_sq, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, "ProjectMO", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta;", "desc."),
(2, "ProjectSP", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta;", "desc."),
(3, "ProjectLM", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta;", "desc.");



-- INSERT G_APP_TB (Without PK)
INSERT INTO GUARD.G_APP_TB
(app_sq, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, "guard", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
(2, "dict", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
(3, "stamp", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");



-- INSERT G_USER_TB (Without PK)
INSERT INTO GUARD.G_USER_TB
(user_sq, organ_sq, username, password, email, name, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
-- tony & ProjectMO(1)
(1, 1, "tony", "1234", "tony_MO@peojectmo.com", "join", "user1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
-- tony & ProjectMO(1) -> Duplicate
-- (4, 1, "tony", "1234", "jm@mo.com", "join", "user1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
-- tony & ProjectMO(2) -> Pass
(4, 2, "tony", "1234", "tony_SP@projectmo.com", "join", "user1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
-- logers & ProjectMO(1)
(2, 1, "logers", "1234", "logers@projectmo.com", "nick", "user2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
-- strange & ProjectMO(1)
(3, 1, "strange", "1234", "strange@projectmo.com", "tony", "user3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");



-- INSERT G_ROLE_TB (Without PK)
INSERT INTO GUARD.G_ROLE_TB
(role_sq, organ_sq, expired_period, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
-- admin(1) & ProjectMO(1)
(1, 1, 60, "admin", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
-- writer(2) & ProjectMO(1)
(2, 1, 60, "developer", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
-- reader(3) & ProjectMO(1)
(3, 1, 60, "operator", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");



---- INSERT G_RESOURCE_TB (Without PK)
--INSERT INTO GUARD.G_RESOURCE_TB
--(resource_sq, app_sq, http_method, http_path, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
--VALUES
--(1, 1, "GET", "/api/guard/apps", "res_1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
--(2, 1, "POST", "/api/guard/apps", "res_2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
--(3, 1, "PUT", "/api/guard/apps/{appId}", "res_3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3"),
--(4, 1, "GET", "/api/guard/apps/{appId}", "res_4", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");




---- INSERT G_AUTH_TB (Without PK)
--INSERT INTO GUARD.G_AUTH_TB
--(auth_sq, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
--VALUES
---- developer(1)
--(1, "developer", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
---- pm(2)
--(2, "pm", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
---- opt(3)
--(3, "opt", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2");
