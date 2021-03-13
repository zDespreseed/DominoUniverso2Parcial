/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     12/3/2021 9:25:42                            */
/*==============================================================*/


drop index CLIENTE_PK;

drop table CLIENTE;

drop index CLIENTE_PRODUCTO_FK;

drop index CLIENTE_PRODUCTO2_FK;

drop index CLIENTE_PRODUCTO_PK;

drop table CLIENTE_PRODUCTO;

drop index MASCOTA_CONSULTA_FK;

drop index CONSULTA_VETERINARIO_FK;

drop index CONSULTA_PK;

drop table CONSULTA;

drop index MASCOTA_HISTORIAL_FK;

drop index CLIENTE_HISTORIAL_FK;

drop index HISTORIAL_CLINICO_PK;

drop table HISTORIAL_CLINICO;

drop index CLIENTE_MASCOTA_FK;

drop index MASCOTAS_PK;

drop table MASCOTAS;

drop index PRODUCTO_PROVEEDOR_FK;

drop index PRODUCTOS_PK;

drop table PRODUCTOS;

drop index PROVEEDOR_PK;

drop table PROVEEDOR;

drop index MASCOTAS_VACUNAS_FK;

drop index VACUNAS_VETERINARIO_FK;

drop index VACUNAS_PK;

drop table VACUNAS;

drop index VETERINARIO_PK;

drop table VETERINARIO;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CI_CLIENTE           INT4                 not null,
   NOMBRES_C            VARCHAR(30)          not null,
   APELLIDOS_C          VARCHAR(40)          not null,
   GENERO_MASC          VARCHAR(15)          not null,
   DIRECCION_C          VARCHAR(70)          not null,
   TELEFONO_C           INT4                 not null,
   FECHA_REGISTRO       DATE                 not null,
   ANTIGUEDAD           VARCHAR(10)          not null,
   FECHA_ULTI_VISI      DATE                 not null,
   NUM_MASCOTA_LL       INT2                 not null,
   constraint PK_CLIENTE primary key (CI_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CI_CLIENTE
);

/*==============================================================*/
/* Table: CLIENTE_PRODUCTO                                      */
/*==============================================================*/
create table CLIENTE_PRODUCTO (
   COD_PRODUCTOS        INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   constraint PK_CLIENTE_PRODUCTO primary key (COD_PRODUCTOS, CI_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO_PK                                   */
/*==============================================================*/
create unique index CLIENTE_PRODUCTO_PK on CLIENTE_PRODUCTO (
COD_PRODUCTOS,
CI_CLIENTE
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO2_FK                                  */
/*==============================================================*/
create  index CLIENTE_PRODUCTO2_FK on CLIENTE_PRODUCTO (
CI_CLIENTE
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO_FK                                   */
/*==============================================================*/
create  index CLIENTE_PRODUCTO_FK on CLIENTE_PRODUCTO (
COD_PRODUCTOS
);

/*==============================================================*/
/* Table: CONSULTA                                              */
/*==============================================================*/
create table CONSULTA (
   COD_CONSULTA         INT4                 not null,
   CI_VETERINARIO       INT4                 not null,
   ID_MASCOTAS          INT4                 not null,
   FECHA_CONSULTA       DATE                 null,
   constraint PK_CONSULTA primary key (COD_CONSULTA)
);

/*==============================================================*/
/* Index: CONSULTA_PK                                           */
/*==============================================================*/
create unique index CONSULTA_PK on CONSULTA (
COD_CONSULTA
);

/*==============================================================*/
/* Index: CONSULTA_VETERINARIO_FK                               */
/*==============================================================*/
create  index CONSULTA_VETERINARIO_FK on CONSULTA (
CI_VETERINARIO
);

/*==============================================================*/
/* Index: MASCOTA_CONSULTA_FK                                   */
/*==============================================================*/
create  index MASCOTA_CONSULTA_FK on CONSULTA (
ID_MASCOTAS
);

/*==============================================================*/
/* Table: HISTORIAL_CLINICO                                     */
/*==============================================================*/
create table HISTORIAL_CLINICO (
   COD_H                INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   ID_MASCOTAS          INT4                 not null,
   FECHA_VISITA         DATE                 not null,
   constraint PK_HISTORIAL_CLINICO primary key (COD_H)
);

/*==============================================================*/
/* Index: HISTORIAL_CLINICO_PK                                  */
/*==============================================================*/
create unique index HISTORIAL_CLINICO_PK on HISTORIAL_CLINICO (
COD_H
);

/*==============================================================*/
/* Index: CLIENTE_HISTORIAL_FK                                  */
/*==============================================================*/
create  index CLIENTE_HISTORIAL_FK on HISTORIAL_CLINICO (
CI_CLIENTE
);

/*==============================================================*/
/* Index: MASCOTA_HISTORIAL_FK                                  */
/*==============================================================*/
create  index MASCOTA_HISTORIAL_FK on HISTORIAL_CLINICO (
ID_MASCOTAS
);

/*==============================================================*/
/* Table: MASCOTAS                                              */
/*==============================================================*/
create table MASCOTAS (
   ID_MASCOTAS          INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   NOMBRE               VARCHAR(20)          not null,
   FECHA_NAC            DATE                 not null,
   GENERO_MASC          VARCHAR(15)          not null,
   COLOR                VARCHAR(15)          not null,
   ESTERILIZADO         BOOL                 not null,
   constraint PK_MASCOTAS primary key (ID_MASCOTAS)
);

/*==============================================================*/
/* Index: MASCOTAS_PK                                           */
/*==============================================================*/
create unique index MASCOTAS_PK on MASCOTAS (
ID_MASCOTAS
);

/*==============================================================*/
/* Index: CLIENTE_MASCOTA_FK                                    */
/*==============================================================*/
create  index CLIENTE_MASCOTA_FK on MASCOTAS (
CI_CLIENTE
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   COD_PRODUCTOS        INT4                 not null,
   COD_PROVEEDOR        INT4                 not null,
   NOMBRE_PR            VARCHAR(40)          not null,
   CANTIDAD_PR          INT4                 null,
   VALOR_PR             DECIMAL(10)          null,
   constraint PK_PRODUCTOS primary key (COD_PRODUCTOS)
);

/*==============================================================*/
/* Index: PRODUCTOS_PK                                          */
/*==============================================================*/
create unique index PRODUCTOS_PK on PRODUCTOS (
COD_PRODUCTOS
);

/*==============================================================*/
/* Index: PRODUCTO_PROVEEDOR_FK                                 */
/*==============================================================*/
create  index PRODUCTO_PROVEEDOR_FK on PRODUCTOS (
COD_PROVEEDOR
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   COD_PROVEEDOR        INT4                 not null,
   NOMBRE_P             CHAR(20)             not null,
   DIRECCION_P          VARCHAR(40)          null,
   constraint PK_PROVEEDOR primary key (COD_PROVEEDOR)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
COD_PROVEEDOR
);

/*==============================================================*/
/* Table: VACUNAS                                               */
/*==============================================================*/
create table VACUNAS (
   COD_VACUNA           INT4                 not null,
   CI_VETERINARIO       INT4                 not null,
   ID_MASCOTAS          INT4                 not null,
   DOSIS                VARCHAR(15)          not null,
   FECHA                DATE                 not null,
   constraint PK_VACUNAS primary key (COD_VACUNA)
);

/*==============================================================*/
/* Index: VACUNAS_PK                                            */
/*==============================================================*/
create unique index VACUNAS_PK on VACUNAS (
COD_VACUNA
);

/*==============================================================*/
/* Index: VACUNAS_VETERINARIO_FK                                */
/*==============================================================*/
create  index VACUNAS_VETERINARIO_FK on VACUNAS (
CI_VETERINARIO
);

/*==============================================================*/
/* Index: MASCOTAS_VACUNAS_FK                                   */
/*==============================================================*/
create  index MASCOTAS_VACUNAS_FK on VACUNAS (
ID_MASCOTAS
);

/*==============================================================*/
/* Table: VETERINARIO                                           */
/*==============================================================*/
create table VETERINARIO (
   CI_VETERINARIO       INT4                 not null,
   NOMBRE_V             VARCHAR(20)          not null,
   APELLIDO_V           VARCHAR(20)          not null,
   FECHA_NACI_V         DATE                 not null,
   constraint PK_VETERINARIO primary key (CI_VETERINARIO)
);

/*==============================================================*/
/* Index: VETERINARIO_PK                                        */
/*==============================================================*/
create unique index VETERINARIO_PK on VETERINARIO (
CI_VETERINARIO
);

alter table CLIENTE_PRODUCTO
   add constraint FK_CLIENTE__CLIENTE_P_PRODUCTO foreign key (COD_PRODUCTOS)
      references PRODUCTOS (COD_PRODUCTOS)
      on delete restrict on update restrict;

alter table CLIENTE_PRODUCTO
   add constraint FK_CLIENTE__CLIENTE_P_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

alter table CONSULTA
   add constraint FK_CONSULTA_CONSULTA__VETERINA foreign key (CI_VETERINARIO)
      references VETERINARIO (CI_VETERINARIO)
      on delete restrict on update restrict;

alter table CONSULTA
   add constraint FK_CONSULTA_MASCOTA_C_MASCOTAS foreign key (ID_MASCOTAS)
      references MASCOTAS (ID_MASCOTAS)
      on delete restrict on update restrict;

alter table HISTORIAL_CLINICO
   add constraint FK_HISTORIA_CLIENTE_H_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

alter table HISTORIAL_CLINICO
   add constraint FK_HISTORIA_MASCOTA_H_MASCOTAS foreign key (ID_MASCOTAS)
      references MASCOTAS (ID_MASCOTAS)
      on delete restrict on update restrict;

alter table MASCOTAS
   add constraint FK_MASCOTAS_CLIENTE_M_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_PRODUCTO__PROVEEDO foreign key (COD_PROVEEDOR)
      references PROVEEDOR (COD_PROVEEDOR)
      on delete restrict on update restrict;

alter table VACUNAS
   add constraint FK_VACUNAS_MASCOTAS__MASCOTAS foreign key (ID_MASCOTAS)
      references MASCOTAS (ID_MASCOTAS)
      on delete restrict on update restrict;

alter table VACUNAS
   add constraint FK_VACUNAS_VACUNAS_V_VETERINA foreign key (CI_VETERINARIO)
      references VETERINARIO (CI_VETERINARIO)
      on delete restrict on update restrict;

