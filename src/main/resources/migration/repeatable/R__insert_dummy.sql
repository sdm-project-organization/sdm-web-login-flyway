-- INSERT G_APP_TB (Without PK)
INSERT INTO GUARD.G_APP_TB
(app_sq, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, "app1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
(2, "app2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
(3, "app3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");

-- INSERT G_USER_TB (Without PK)
INSERT INTO GUARD.G_USER_TB
(user_sq, user_id, password, email, name, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, "user_id1", "1234", "jm@mo.com", "join", "user1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
(2, "user_id2", "1234", "yj@mo.com", "nick", "user2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
(3, "user_id3", "1234", "sh@mo.com", "tony", "user3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");

-- INSERT G_RESOURCE_TB (Without PK)
INSERT INTO GUARD.G_RESOURCE_TB
(resource_sq, app_sq, path, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, 1, "/a/b", "res_1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
(2, 1, "/a/c", "res_2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
(3, 1, "/a/d", "res_3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");

-- INSERT G_AUTH_TB (Without PK)
INSERT INTO GUARD.G_AUTH_TB
(auth_sq, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, "auth_1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
(2, "auth_2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
(3, "auth_3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");

-- INSERT G_ROLE_TB (Without PK)
INSERT INTO GUARD.G_ROLE_TB
(role_sq, expired_period, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
(1, 60, "role_1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
(2, 60, "role_2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
(3, 60, "role_3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");

-- INSERT G_R_AUTH_RESOURCE_TB (Without PK)
INSERT INTO GUARD.G_R_AUTH_RESOURCE_TB
(auth_sq, resource_sq, disp_nm, disp_ord, created_dt, updated_dt, writer, editor, active_fl, enable_fl, meta, `desc`)
VALUES
( 1, 1, "auth_res_1", 1, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta1", "desc1"),
( 1, 2, "auth_res_2", 2, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta2", "desc2"),
( 1, 3, "auth_res_3", 3, NOW(), NOW(), "sdm", "sdm", 1, 1, "meta3", "desc3");
