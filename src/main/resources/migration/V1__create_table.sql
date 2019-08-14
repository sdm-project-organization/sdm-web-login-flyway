


CREATE TABLE G_ORGAN_TB
(
  organ_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(organ_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE G_APP_TB
(
  app_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  meta VARCHAR(256),
  `desc` VARCHAR(256),

  PRIMARY KEY(app_sq)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE G_USER_TB
(
  user_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  organ_sq INT UNSIGNED NOT NULL,
  username VARCHAR (256),
  password VARCHAR (256),
  email VARCHAR (256),
  name VARCHAR (256),

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
  meta VARCHAR(256),
  `desc` VARCHAR(256),

  UNIQUE KEY(organ_sq, username),
  PRIMARY KEY(user_sq),
  FOREIGN KEY(organ_sq) REFERENCES G_ORGAN_TB(organ_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX G_USER_IDX01 ON G_USER_TB(organ_sq);



CREATE TABLE G_ROLE_TB
(
  role_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  organ_sq INT UNSIGNED NOT NULL,
  expired_period INT,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
  meta VARCHAR(256),
  `desc` VARCHAR(256),

  UNIQUE KEY(organ_sq, disp_nm),
  PRIMARY KEY(role_sq),
  FOREIGN KEY(organ_sq) REFERENCES G_ORGAN_TB(organ_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX G_ROLE_IDX01 ON G_ROLE_TB(organ_sq);

CREATE TABLE G_AUTH_TB
(
  auth_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  app_sq INT UNSIGNED NOT NULL,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
  meta VARCHAR(256),
  `desc` VARCHAR(256),

  UNIQUE KEY(app_sq, disp_nm),
  PRIMARY KEY(auth_sq),
  FOREIGN KEY(app_sq) REFERENCES G_APP_TB(app_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX G_AUTH_IDX01 ON G_AUTH_TB(app_sq);

CREATE TABLE G_RESOURCE_TB
(
  resource_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  app_sq INT UNSIGNED NOT NULL,
  http_method VARCHAR(256) ,
  http_path VARCHAR(256),

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
  meta VARCHAR(256),
  `desc` VARCHAR(256),

  UNIQUE KEY(app_sq, http_method, http_path),
  PRIMARY KEY(resource_sq),
  FOREIGN KEY(app_sq) REFERENCES G_APP_TB(app_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX G_RESOURCE_IDX01 ON G_RESOURCE_TB(app_sq, http_method, http_path);

CREATE TABLE G_R_APP_USER_TB
(
  app_user_sq INT UNSIGNED NOT NULL AUTO_INCREMENT,
  app_sq INT UNSIGNED NOT NULL,
  user_sq INT UNSIGNED NOT NULL,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME NOT NULL , -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT NOT NULL DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256) NOT NULL ,
  editor VARCHAR(256),
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
  user_sq INT UNSIGNED NOT NULL,
  role_sq INT UNSIGNED NOT NULL,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256),
  editor VARCHAR(256),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(user_sq, role_sq),
  FOREIGN KEY(user_sq) REFERENCES G_USER_TB(user_sq)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(role_sq) REFERENCES G_ROLE_TB(role_sq)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE G_R_ROLE_AUTH_TB
(
  role_sq INT UNSIGNED NOT NULL,
  auth_sq INT UNSIGNED NOT NULL,

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256),
  editor VARCHAR(256),
  meta VARCHAR(256),
  `desc` VARCHAR(256),
  PRIMARY KEY(role_sq, auth_sq),
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

  -- common columns
  disp_nm VARCHAR(256),
  disp_ord SMALLINT UNSIGNED,
  created_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  updated_dt DATETIME, -- [Format] yyyy-MM-dd hh:mm:ss
  active_fl TINYINT DEFAULT 1, -- 1-true, 2-false
  enable_fl TINYINT DEFAULT 1, -- 1-true, 2-false
  writer VARCHAR(256),
  editor VARCHAR(256),
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