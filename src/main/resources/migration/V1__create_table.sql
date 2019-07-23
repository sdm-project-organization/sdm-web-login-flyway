
CREATE TABLE G_APP_TB
(
  app_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(app_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_USER_TB
(
  user_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id VARCHAR (64),
  password VARCHAR (64),
  email VARCHAR (64),
  name VARCHAR (64),

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(user_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_ROLE_TB
(
  role_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  expired_period INT,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(role_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_AUTH_TB
(
  auth_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(auth_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_RESOURCE_TB
(
  resource_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  app_sq INT UNSIGNED NOT NULL,
  path VARCHAR(256),

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(resource_sq),
  FOREIGN KEY(app_sq) REFERENCES G_APP_TB(app_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_R_APP_USER_TB
(
  app_user_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  app_sq INT UNSIGNED NOT NULL,
  user_sq INT UNSIGNED NOT NULL,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(app_user_sq),
  FOREIGN KEY(app_sq) REFERENCES G_APP_TB(app_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(user_sq) REFERENCES G_USER_TB(user_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_R_USER_ROLE_TB
(
  user_role_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_sq INT UNSIGNED NOT NULL,
  role_sq INT UNSIGNED NOT NULL,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(user_role_sq),
  FOREIGN KEY(user_sq) REFERENCES G_USER_TB(user_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(role_sq) REFERENCES G_ROLE_TB(role_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_R_ROLE_AUTH_TB
(
  role_auth_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  role_sq INT UNSIGNED NOT NULL,
  auth_sq INT UNSIGNED NOT NULL,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(role_auth_sq),
  FOREIGN KEY(role_sq) REFERENCES G_ROLE_TB(role_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(auth_sq) REFERENCES G_AUTH_TB(auth_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_R_AUTH_RESOURCE_TB
(
--  auth_resource_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  auth_sq INT UNSIGNED NOT NULL,
  resource_sq INT UNSIGNED NOT NULL,

  disp_nm VARCHAR(64),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(16) NOT NULL ,
  editor VARCHAR(16),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(auth_sq, resource_sq),
  FOREIGN KEY(auth_sq)
    REFERENCES G_AUTH_TB(auth_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(resource_sq)
    REFERENCES G_RESOURCE_TB(resource_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;