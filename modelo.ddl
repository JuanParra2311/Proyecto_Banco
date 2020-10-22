-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2020-10-21 11:09:28 CDT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE cliente (
    id_cliente             VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    nombre                 VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    direccion              VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    cuidad                 VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    registro_id_registro   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        registro_id_registro
    ASC );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE cuenta (
    "id-cuenta"          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    id_cliente           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    cliente_id_cliente   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

ALTER TABLE cuenta ADD CONSTRAINT cuenta_pk PRIMARY KEY ( "id-cuenta",
                                                          cliente_id_cliente );

CREATE TABLE prestamo (
    id_prestamo                    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    id_cliente                     VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    transacciones_id_transaccion   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

CREATE UNIQUE INDEX prestamo__idx ON
    prestamo (
        transacciones_id_transaccion
    ASC );

ALTER TABLE prestamo ADD CONSTRAINT prestamo_pk PRIMARY KEY ( id_prestamo );

CREATE TABLE registro (
    id_registro          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    id_cliente           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    cliente_id_cliente   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

CREATE UNIQUE INDEX registro__idx ON
    registro (
        cliente_id_cliente
    ASC );

ALTER TABLE registro ADD CONSTRAINT registro_pk PRIMARY KEY ( id_registro );

CREATE TABLE saldo (
    id_saldo                       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    transacciones_id_transaccion   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

CREATE UNIQUE INDEX saldo__idx ON
    saldo (
        transacciones_id_transaccion
    ASC );

ALTER TABLE saldo ADD CONSTRAINT saldo_pk PRIMARY KEY ( id_saldo );

CREATE TABLE transacciones (
    id_saldo               VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    id_prestamo            VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    id_transaccion         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    cliente_id_cliente     VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    saldo_id_saldo         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    prestamo_id_prestamo   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

CREATE UNIQUE INDEX transacciones__idx ON
    transacciones (
        saldo_id_saldo
    ASC );

CREATE UNIQUE INDEX transacciones__idxv1 ON
    transacciones (
        prestamo_id_prestamo
    ASC );

ALTER TABLE transacciones ADD CONSTRAINT transacciones_pk PRIMARY KEY ( id_transaccion );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_registro_fk FOREIGN KEY ( registro_id_registro )
        REFERENCES registro ( id_registro );

ALTER TABLE cuenta
    ADD CONSTRAINT cuenta_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE prestamo
    ADD CONSTRAINT prestamo_transacciones_fk FOREIGN KEY ( transacciones_id_transaccion )
        REFERENCES transacciones ( id_transaccion );

ALTER TABLE registro
    ADD CONSTRAINT registro_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE saldo
    ADD CONSTRAINT saldo_transacciones_fk FOREIGN KEY ( transacciones_id_transaccion )
        REFERENCES transacciones ( id_transaccion );

ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_prestamo_fk FOREIGN KEY ( prestamo_id_prestamo )
        REFERENCES prestamo ( id_prestamo );

ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_saldo_fk FOREIGN KEY ( saldo_id_saldo )
        REFERENCES saldo ( id_saldo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             6
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  22
-- WARNINGS                                 0
