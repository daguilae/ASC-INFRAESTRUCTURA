create database if not exists db_clc;
use db_clc;
create table if not exists LOGIN(
	pk_id_login 						int(10) not null primary key auto_increment,
    usuario_login 						varchar(45),
    contraseña_login 					varchar(45),
    nombreCompleto_login				varchar(100),
    estado_login						int(2)
);
-- --------------------------------------------------------------------------------
create table if not exists MODULO(
	pk_id_modulo 						int(10)not null auto_increment,
    nombre_modulo 						varchar(30)not null,
    descripcion_modulo 					varchar(50)not null,
    estado_modulo 						int(1)not null,
    primary key(pk_id_modulo),
    key(pk_id_modulo)
);
create table if not exists APLICACION(
	pk_id_aplicacion 					int(10)not null auto_increment,
    fk_id_modulo 						int(10)not null,
    nombre_aplicacion 					varchar(40)not null,
    descripcion_aplicacion 				varchar(45)not null,
    estado_aplicacion 					int(1)not null,
    primary key(pk_id_aplicacion),
    key(pk_id_aplicacion)
);
create table if not exists PERFIL(
	pk_id_perfil						int(10) not null primary key auto_increment,
    nombre_perfil						varchar(50),
    descripcion_perfil					varchar(100),
    estado_perfil						int(2)
);
create table if not exists APLICACION_PERFIL(
	pk_id_aplicacion_perfil				int(10) not null primary key auto_increment,
    fk_idaplicacion_aplicacion_perfil	int(10),
    fk_idperfil_aplicacion_perfil		int(10),
    fk_idpermiso_aplicacion_perfil		int(10)
);
-- ------------------------------------
create table if not exists PERFIL_USUARIO(
	pk_id_perfil_usuario				int(10) not null primary key auto_increment,
    fk_idusuario_perfil_usuario			int(10),
    fk_idperfil_perfil_usuario			int(10)
);
create table if not exists APLICACION_USUARIO(
	pk_id_aplicacion_usuario			int(10) not null primary key auto_increment,
    fk_idlogin_aplicacion_usuario		int(10),
    fk_idaplicacion_aplicacion_usuario	int(10),
    fk_idpermiso_aplicacion_usuario		int(10)
);
create table if not exists PERMISO(
	pk_id_permiso						int(10) not null primary key auto_increment,
    insertar_permiso					boolean,
    modificar_permiso					boolean,
    eliminar_permiso					boolean,
    consultar_permiso					boolean,
    imprimir_permiso					boolean
);

#------BITACORA-----------------------------------------
create table if not exists BITACORA(
	pk_id_bitacora						int(10) not null primary key auto_increment, #pk
    fk_idusuario_bitacora				int(10),
    fk_idaplicacion_bitacora			int(10),
    fechahora_bitacora					varchar(50),
    direccionhost_bitacora				varchar(20),
    nombrehost_bitacora					varchar(20),
    accion_bitacora						varchar(250)
);
CREATE TABLE IF NOT EXISTS DETALLE_BITACORA (
    pk_id_detalle_bitacora 				INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_idbitacora_detalle_bitacora 		INT(10),
    querryantigua_detalle_bitacora 		VARCHAR(50),
    querrynueva_detalle_bitacora 		VARCHAR(50)
);


#-------REPORTEADOR-------------------------------------
create table if not exists REPORTE(
	pk_id_reporte int(10)not null auto_increment,
    nombre_reporte varchar(40)not null,
    ruta_reporte varchar(100)not null,
    estado_reporte int(1)not null,
    primary key(pk_id_reporte),
    key(pk_id_reporte)
);
create table if not exists REPORTE_MODULO(
	fk_id_reporte int(10)not null ,
    fk_id_modulo int(10)not null,
    estado_reporte_modulo int(1)not null,
    primary key(fk_id_reporte,fk_id_modulo),
    key(fk_id_reporte,fk_id_modulo)
);
create table if not exists REPORTE_APLICATIVO(
	fk_id_reporte int(10)not null,
    fk_id_aplicacion int(10)not null,
    fk_id_modulo int(10)not null,
    estado_reporte_aplicativo int(1)not null,
    primary key(fk_id_reporte,fk_id_aplicacion,fk_id_modulo),
    key(fk_id_reporte,fk_id_aplicacion,fk_id_modulo)
);

#-------CRM---------------------------------------------
CREATE TABLE IF NOT EXISTS CLIENTE (
  pk_idcliente 						INT NOT NULL,
  nombre 							VARCHAR(45) NULL,
  apellido 							VARCHAR(45) NULL,
  fecha_de_nacimiento		 		DATE NULL,
  PRIMARY KEY (pk_idcliente)
);
CREATE TABLE IF NOT EXISTS CATEGORIA_TAMAÑO (
  pk_idcategoriatamaño 				INT NOT NULL,
  nombre 							VARCHAR(45) NULL,
  descripcion			 			VARCHAR(45) NULL,
  PRIMARY KEY (pk_idcategoriatamaño)
);
CREATE TABLE IF NOT EXISTS CATEGORIA_TIPO (
  pk_idcategoriatipo 				INT NOT NULL,
  nombre_categoria_tipo 			VARCHAR(45) NULL,
  descripcion_categoria_tipo 		VARCHAR(45) NULL,
  PRIMARY KEY (pk_idcategoriatipo)
);
CREATE TABLE IF NOT EXISTS PRODUCTO (
  pk_idproducto 					INT NOT NULL,
  nombre 							VARCHAR(45) NULL,
  precio 							VARCHAR(45) NULL,
  descripcion						VARCHAR(45) NULL,
  fk_idcategoriatamaño				INT NOT NULL,
  fk_idcategoriatipo 				INT NOT NULL,
  PRIMARY KEY (pk_idproducto)
);
CREATE TABLE IF NOT EXISTS VENTA (
  pk_idventa 						INT NOT NULL,
  fecha 							DATE NULL,
  fk_idcliente		 				INT NOT NULL,
  fk_idproducto		 				INT NOT NULL,
  PRIMARY KEY (pk_idventa)
);
CREATE TABLE IF NOT EXISTS MODO_DE_PAGO (
  pk_idmodopago 					INT NOT NULL,
  tipo_pago							VARCHAR(45) NULL,
  PRIMARY KEY (pk_idmodopago)
);
CREATE TABLE IF NOT EXISTS FACTURA (
  pk_idfactura 						INT NOT NULL,
  fk_idmodopago						INT NOT NULL,
  fk_idcliente						INT NOT NULL,
  fK_idEMPLEADO						INT NOT NULL,
  fecha								DATE NULL,
  PRIMARY KEY (pk_idfactura)
);
CREATE TABLE IF NOT EXISTS CUENTAS_POR_COBRAR (
  pk_idcuentacobrar 				INT NOT NULL AUTO_INCREMENT,
  cuota								VARCHAR(45) NULL,
  abono								VARCHAR(45) NULL,
  fk_idfactura 						INT NOT NULL,
  fk_idcliente 						INT NOT NULL,
  PRIMARY KEY (pk_idcuentacobrar)
);
CREATE TABLE IF NOT EXISTS INVENTARIOCRM (
  pk_idinventario 					INT NOT NULL,
  existencia 						INT NULL,
  fk_idproducto 					INT NOT NULL,
  PRIMARY KEY (pk_idinventario)
);
CREATE TABLE IF NOT EXISTS CORREO_CLIENTE (#Direccion fisica de una casa.
  pk_iddireccionCliente 			INT NOT NULL,
  numero				 			VARCHAR(45) NULL,
  calle				 				VARCHAR(45) NULL,
  colonia				 			VARCHAR(45) NULL,
  ciudad							VARCHAR(45) NULL,
  fk_idcliente				 		INT NOT NULL,
  PRIMARY KEY (pk_iddireccionCliente)
);
CREATE TABLE IF NOT EXISTS TELEFONO_CLIENTE (
  pk_idtelefono 					INT NOT NULL,
  Numero_Telefono 					VARCHAR(8) NULL,
  fk_idcliente 						INT NOT NULL,
  PRIMARY KEY (pk_idtelefono)
);
CREATE TABLE IF NOT EXISTS CORREO_CLIENTE (
  pk_iddireccionCliente 			INT NOT NULL,
  numero				 			VARCHAR(45) NULL,
  calle								VARCHAR(45) NULL,
  colonia				 			VARCHAR(45) NULL,
  ciudad							VARCHAR(45) NULL,
  fk_idcliente 						INT NOT NULL,
  PRIMARY KEY (pk_iddireccionCliente)
);
CREATE TABLE IF NOT EXISTS CONTROL_EMPLEADO (-- -------------arreglar
  pk_idControlEmpleado 				INT NOT NULL,
  Horas_Efectivas_De_Trabajo 		VARCHAR(45) NULL,
  Horas_Extras 						VARCHAR(45) NULL,
  Comisiones 						VARCHAR(45) NULL,
  fK_idEMPLEADO 					INT NOT NULL,
  fk_idventa 						INT NOT NULL,
  PRIMARY KEY (pk_idControlEmpleado)
);
CREATE TABLE IF NOT EXISTS DETALLE_FACTURA (
  pk_id_detalle_factura 			INT NOT NULL,
  fk_idfactura 						INT NOT NULL,
  fk_idproducto 					INT NOT NULL,
  cantidad 							INT NULL,
  precio 							FLOAT NULL,
  PRIMARY KEY (pk_id_detalle_factura)
);
#-------MRP---------------------------------------------
create table if not exists CONTROLCALIDAD(
  pk_id_controlcalidad						int(10) not null primary key auto_increment,
  fk_idordenproduccion_controlcalidad 		int not null,
  fk_idinventario_controlcalidad 			int not null, #porque inventario?
  fk_idresponsable_controlcalidad 			int(10) not null,
  resultado_controlcalidad					varchar(45),
  estado_controlcalidad						int(2)
);
create table if not exists CONTROLPRODUCTO (
  pk_id_controlproducto 					INT(10) NOT NULL primary key auto_increment,
  fk_idordenproduccion_controlproducto 		INT(10) NULL,
  fk_idestadoproduccion_controlproducto		INT(10) NULL,
  resultado_controlproducto					varchar(45),
  estado_controlproducto					int(2)
);
create table if not exists ESTADOPRODUCCION(
  pk_id_estadoproduccion 					INT(10) NOT NULL primary key auto_increment,
  nombre_estadoproduccion 					VARCHAR(45) NULL,
  duracion_estadoproduccion					VARCHAR(45) NULL
);
create table if not exists HORAEMPLEADO (
  pk_id_horaempleado						INT(10) NOT NULL primary key auto_increment,
  fk_idempleado_horaempleado				INT(10) NULL,
  tiempo_horaempleado						INT NULL,
  fk_idordenproduccion_horaempleado			INT NULL#porque se necesita orden de produccion?
);
create table if not exists INVENTARIOMRP(
  pk_id_inventario 							INT(10) NOT NULL primary key auto_increment,
  fk_idmateriaprimainsumo_inventario		INT NULL,
  fk_idtipoinventario_inventario 			INT NULL,
  fecha_inventario							DATE NULL,
  cantidad_inventario						INT NULL,
  estado_inventario							int(2)
);
create table if not exists MATERIAPRIMAINSUMO (
  pk_id_materiaprimainsumo 					INT(10) NOT NULL primary key auto_increment,
  nombre_materiaprimainsumo					VARCHAR(45) NULL,
  descripcion_materiaprimainsumo 			VARCHAR(45) NULL,
  marca_materiaprimainsumo 					VARCHAR(45) NULL,
  estado_materiaprimainsumo 				TINYINT(1) NULL,
  precio_materiaprimainsumo 				DOUBLE NULL
);
create table if not exists ORDENCOMPRA(
  pk_id_ordencompra 						INT(10) NOT NULL primary key auto_increment,
  fk_idmateriaprimainsumos_ordencompra 		INT NULL,
  fechaenvio_ordencompra			 		DATE NULL,
  cantidad_ordencompra 		 				int NULL,
  estado_ordencompra						TINYINT(1) NULL
);
create table if not exists ORDENPRODUCCION (
  pk_id_ordenproduccion 					INT(10) NOT NULL primary key auto_increment,
  fk_idtipoproducto_idordenproduccion 		INT(10) NULL,
  cantidad_ordenproduccion					INT NULL,
  fecha_ordenproduccion 					VARCHAR(45) NULL,
  estado_ordenproduccion 					TINYINT(1) NULL
);
create table if not exists PRODUCTODETALLE (
  pk_id_productodetalle 						INT(10) NOT NULL primary key auto_increment,
  fk_idtipoproductoencabezado_productodetalle 	INT NULL,
  fk_idmateriaprimainsumo_productodetalle 		INT NULL,
  cantidad_productodetalle 						INT NULL,
  estado_productodetalle						int(2)
);
create table if not exists TIPOINVENTARIO (
  pk_id_tipoinventario 						INT(10) NOT NULL primary key auto_increment,
  nombre_tipoinventario 					VARCHAR(45) NULL,
  descripcion_tipo_inventario 				VARCHAR(45) NULL
  );  
create table if not exists TIPOPRODUCTOENCABEZADO (
  pk_id_tipoproductoencabezado	 			INT(10) NOT NULL primary key auto_increment,
  nombre_tipoproductoencabezado 			VARCHAR(45) NULL,
  descripcion_tipoproductoencabezado 		VARCHAR(45) NULL,
  precio_tipoproductoencabezado 			DOUBLE NULL,
  estado_tipoproductoencabezado				int(2)
  );
#-------FRM---------------------------------------------  
CREATE TABLE BANCO(
	pk_idbanco 								int not null primary key,
	nombre_banco 							varchar(50),
	estado_banco 							tinyint
);
CREATE TABLE AREA(
	pk_idarea 								int not null primary key,
	nombre_area 							varchar(45),
	descripcion_area 						varchar(75),
	estado_area 							tinyint
);
CREATE TABLE TIPO_MONEDA(
	pk_idtipomoneda 						int not null primary key,
	moneda_tipo_moneda 						varchar(45),
	simbolo_tipo_moneda 					varchar(2),
	descripcion_tipo_moneda 				varchar(75),
	estado_tipo_moneda 						tinyint
);
CREATE TABLE PRESUPUESTO(
	pk_idpresupuesto 						int not null primary key,
	nombre_presupuesto 						varchar(45),
	cantidad_presupuesto 					double,
	fk_idtipomoneda 						int not null,
	fk_area 								int not null,
	descripcion_presupuesto 				varchar(75),
	estado_presupuesto 						tinyint
);
CREATE TABLE PROPIETARIO(
	pk_idpropietario 						int not null primary key,
	nombre_propietario 						varchar(45),
	descripcion_propietario 				varchar(75),
	estado_propietario 						tinyint
);
CREATE TABLE CUENTA_BANCARIA(
	pk_idnumerocuenta 						int not null primary key,
	fk_idbanco 								int not null,
	fk_idpropietario 						int not null,
	fk_idtipomoneda 						int not null,
	saldo_cuenta_bancaria 					double,
	fecha_apertura_cuenta_bancaria 			datetime,
	estado_apertura_cuenta 					tinyint
);
CREATE TABLE TIPO_TRANSACCION(
	pk_idtipotransaccion 					int not null primary key,
	nombre_tipo_transaccion 				varchar(45),
	descripcion_tipo_transaccion 			varchar(75),
	estado_tipo_transaccion 				tinyint
);
CREATE TABLE ENCABEZADO_TRANSACCION(
	pk_idencabezadotransaccion 				int not null primary key,
	fk_idnumerocuenta 						int not null,
	fecha_encabezado_transaccion 			datetime
);
CREATE TABLE DETALLE_TRANSACCION(
	pk_iddetalletransaccion 				int not null primary key,
	fk_idencabezadotransaccion 				int not null,
	fk_idtipotransaccion 					int not null,
	monto_detalle_transaccion 				double,
	descripcion_detalle_transaccion 		varchar(75)
);
CREATE TABLE CUENTA_CONTABLE(
	pk_idcuenta 							int not null primary key,
	nombre_cuenta_contable 					varchar(75),
	nivel_cuenta_contable 					int,
	fk_cuentapadre 							int,
	saldo_cuenta_contable 					double,
	estado_cuenta_contable 					tinyint
);
CREATE TABLE SALDO_HISTORICO(
	pk_idcuenta 							int not null primary key,
	fecha_saldo_historico 					datetime not null,
	monto_saldo_historico 					double
);
CREATE TABLE DIARIO_ENCABEZADO (
	pk_polizaencabezado 					int not null primary key,
	fecha_diarioencabezado 					datetime,
	descripcion_diarioencabezado 			varchar(75),
	estado_diarioencabezado 				tinyint,
	total_diarioencabezado 					double
);
CREATE TABLE DIARIO_DETALLE(
	pk_polizaencabezado 					int not null primary key,
	pk_idcuenta 							int not null,
	monto_diario_detalle 					double,
	debe_diario_detalle 					tinyint
);
CREATE TABLE MAYOR_ENCABEZADO(
	pk_idmayorencabezado 					int not null primary key,
	pk_idcuenta 							int not null,
	montoDebe_mayor_encabezado 				double,
	montoHaber_mayor_encabezado 			double,
	fecha_mayor_encabezado 					datetime
);
CREATE TABLE MAYOR_DETALLE(
	pk_idmayorencabezado 					int not null primary key,
	pk_polizaencabezado 					int not null,
	subtotal_mayor_detalle 					double
);
CREATE TABLE BALANCE_ENCABEZADO(
	pk_idbalanceencabezado 					int not null primary key,
	descripcion_balance_encabezado 			varchar(75),
	fechaCreacion_balance_encabezado 		datetime,
	totalDebeHaber_balance_encabezado 		double,
	totalDeudorAcreedor_balance_encabezado 	double
);
CREATE TABLE BALANCE_DETALLE(
	pk_idbalanceencabezado 					int not null primary key,
	pk_idcuenta 							int not null,
	debe_balance_detalle 					double,
	haber_balance_detalle 					double,
	deudor_balance_detalle 					double,
	acreedor_balance_detalle 				double
);
#-------SCM--------------------------------------------- 
create table INVENTARIO(
	pk_id_inventario int(10)not null auto_increment,
    fk_id_bodega int(10)not null,
    fk_id_producto int(10)not null,
    existencia_inventario int(10)not null,
    estado_inventario int(1)not null,
    primary key(pk_id_inventario),
    key(pk_id_inventario)
);
create table PRODUCTOSCM(
	pk_id_producto int(10)not null auto_increment,
    fk_id_linea_producto int(10)not null,
    fk_id_categoria_producto int(10)not null,
    nombre_producto varchar(50)not null,
    precio_producto double(12,2)not null,
    medida_producto double(5,2)not null,
    descripcion_producto varchar(45)not null,
    estado_producto int(1)not null,
    primary key(pk_id_producto),
    key(pk_id_producto)
);
create table LINEA_PRODUCTO(
	pk_id_linea_producto int(10)not null auto_increment,
    nombre_linea_producto varchar(25)not null,
    descripcion_linea_producto varchar(50) not null,
    estado_linea_producto int(1) not null,
    primary key(pk_id_linea_producto),
    key(pk_id_linea_producto)
);
create table PROVEEDOR(
	pk_id_proveedor int(10)not null auto_increment,
    fk_id_pais int(10)not null,
    razon_social_proveedor varchar(45)not null,
    representante_legal_proveedor varchar(45) not null,
    nit_proveedor varchar(20)not null,
    estado_proveedor int(1)not null,
    primary key(pk_id_proveedor),
    key(pk_id_proveedor)
);
create table TELEFONO_PROVEEDOR(
	pk_id_telefono_proveedor int(10)not null auto_increment,
    fk_id_proveedor int(10)not null,
    telefono_telefono_proveedor varchar(20)not null,
    primary key(pk_id_telefono_proveedor),
    key(pk_id_telefono_proveedor)
);
create table CORREO_PROVEEDOR(
	pk_id_correo_proveedor int(10)not null auto_increment,
    fk_id_proveedor int(10)not null,
    correo_correo_proveedor varchar(50)not null,
    primary key(pk_id_correo_proveedor),
    key(pk_id_correo_proveedor)
);
create table CATEGORIA_PRODUCTO(
	pk_id_categoria_producto int(10) not null auto_increment,
    nombre_categoria_producto varchar(35)not null,
    descripcion_categoria_producto varchar(60)not null,
    estado_categoria_producto int(1)not null,
    primary key(pk_id_categoria_producto),
    key(pk_id_categoria_producto)
);
create table PAIS(
	pk_id_pais int(10)not null auto_increment,
    nombre_pais varchar(40)not null,
    capital_pais varchar(40)not null,
    estado_pais int(1)not null,
    primary key(pk_id_pais),
    key(pk_id_pais)
);
create table DEPARTAMENTO(
	pk_id_departamento int(10)not null auto_increment,
    nombre_departamento varchar(30)not null,
    descripcion_departamento varchar(45)not null,
    estado_departamento int(1)not null,
    primary key(pk_id_departamento),
    key(pk_id_departamento)
);
create table MUNICIPIO(
	pk_id_municipio int(10)not null auto_increment,
    fk_id_departamento int(10)not null,
    nombre_municipio varchar(30)not null,
    descripcion_municipio varchar(45)not null,
    estado_municipio int(1)not null,
    primary key(pk_id_municipio),
    key(pk_id_municipio)
);
create table ENCARGADO_BODEGA(
	pk_id_encargado_bodega int(10)not null auto_increment,
    fk_id_empleado int(10)not null,
    fk_id_bodega int(10)not null,
    estado_encargado_bodega int(1)not null,
    primary key(pk_id_encargado_bodega),
    key(pk_id_encargado_bodega)
);
create table BODEGA(
	pk_id_bodega int(10)not null auto_increment,
    fk_id_municipio int(10)not null,
    dimensiones_bodega double(5,2)not null,
    direccion_bodega varchar(45)not null,
    telefono_bodega int(8)not null,
    descripcion_bodega varchar(45)not null,
    estado_bodega int(1)not null,
    primary key(pk_id_bodega),
    key(pk_id_bodega)
);
create table COMPRA_ENCABEZADO(
	pk_id_compra_encabezado int(10)not null,
    fk_id_proveedor int(10)not null,
    fec_compra_encabezado_compra datetime not null,
    total_compra_encabezado_compra double(12,2) not null,
    estado_encabezado_compra int(1)not null,
    primary key(pk_id_compra_encabezado),
    key(pk_id_compra_encabezado)
);
create table COMPRA_DETALLE(
	fk_id_compra_encabezado int(10)not null,
	cod_linea_compra_detalle int(10)not null,
    fk_id_producto int(10)not null,
    cantidad_compra_detalle int(10)not null,
    precio_unitario_compra_detalle double(8,2)not null,
    subtotal_compra_detalle double(12,2)not null,
    estado_compra_detalle int(1)not null,
    primary key(fk_id_compra_encabezado,cod_linea_compra_detalle),
    key(fk_id_compra_encabezado,cod_linea_compra_detalle)
);
create table FABRICA(
	pk_id_fabrica int(10)not null auto_increment,
    fk_id_municipio int(10)not null,
    dimensiones_fabrica double(5,2)not null,
    direccion_fabrica varchar(45)not null,
    telefono_fabrica int(8)not null,
    descripcion_fabrica varchar(45)not null,
    estado_fabrica int(1)not null,
    primary key(pk_id_fabrica),
    key(pk_id_fabrica)
);
create table PEDIDO_ENCABEZADO(
	pk_id_pedido_encabezado int(10)not null,
    fk_id_fabrica int(10)not null,
    fec_pedido_pedido_encabezado datetime not null,
    total_pedido_encabezado double(12,2) not null,
    estado_pedido_encabezado int(1)not null,
    primary key(pk_id_pedido_encabezado),
    key(pk_id_pedido_encabezado)
);
create table PEDIDO_DETALLE(
	fk_id_pedido_encabezado int(10)not null,
	cod_linea_pedido_detalle int(10)not null,
    fk_id_producto int(10)not null,
    cantidad_pedido_detalle int(10)not null,
    precio_unitario_pedido_detalle double(8,2)not null, /*Precio dado por fábrica*/
    subtotal_pedido_detalle double(12,2)not null,
    estado_pedido_detalle int(1)not null,
    primary key(fk_id_pedido_encabezado,cod_linea_pedido_detalle),
    key(fk_id_pedido_encabezado,cod_linea_pedido_detalle)
);
create table ESTADO_PRODUCTO(
	pk_id_estado_producto int(10)not null auto_increment,
    nombre_estado_producto varchar(25)not null,
    descripcion_estado_producto varchar(45)not null,
    estado_estado_producto int(1)not null,
    primary key(pk_id_estado_producto),
    key(pk_id_estado_producto)
);
create table DEVOLUCION_ENCABEZADO(
	pk_id_devolucion_encabezado int(10)not null,
    fk_id_fabrica int(10)not null,
    fk_id_categoria_producto int(10)not null,
    fec_devolucion_encabezado datetime not null,
    total_devolucion_encabezado double(12,2) not null,
    estado_devolucion_encabezado int(1)not null,
    primary key(pk_id_devolucion_encabezado),
    key(pk_id_devolucion_encabezado)
);
create table VEHICULO (
  pk_id_vehiculo int(10)not null auto_increment,
  fk_id_marca int (10) not null,
  placa_vehiculo varchar(45)not null,
  modelo_vehiculo varchar(45)not null,
  color_vehiculo varchar(45)not null,
  anio_vehiculo  varchar(45)not null,
  tipo_combustible_vehiculo varchar(45)not null,
  estado_vehiculo int(1)not null,
  primary key(pk_id_vehiculo),
  key(pk_id_vehiculo)
);
create table MARCA (
	pk_id_marca int(10)not null auto_increment,
	descripcion_marca varchar(45)not null,
	estado_marca int(1)not null,
	primary key(pk_id_marca),
	key(pk_id_marca)
);
create table SUCURSAL(
  pk_id_sucursal int(10)not null auto_increment,
  fk_id_municipio int(10)not null,
  nombre_sucursal varchar(45)not null,
  direccion_sucursal varchar(45)not null,
  telefono_sucursal int(8)not null,
  descripcion_sucursal varchar(45)not null,
  estado_sucursal int(1)not null,
  primary key(pk_id_sucursal),
  key(pk_id_sucursal) 
);
create table ENVIO_PRODUCTO(
  pk_id_envio_producto int(10)not null auto_increment,
  fk_id_ruta int(10)not null,
  fk_id_producto int (10) not null, 
  fk_id_empleado int (10) not null,
  fk_id_vehiculo int (10) not null,
  fec_envio_producto datetime not null,
  fec_recibido_envio_producto datetime not null,
  descripcion_envio_producto varchar(45)not null,
  primary key(pk_id_envio_producto),
  key(pk_id_envio_producto) 
);
create table RUTA(
	pk_id_ruta int(10)not null auto_increment,
    origen_ruta int(10) not null,
    destino_ruta int(10)not null,
    descripcion_ruta varchar(45)not null,
    estado_ruta int(1)not null,
    primary key(pk_id_ruta),
    key(pk_id_ruta)
);
create table DEVOLUCION_DETALLE(
	fk_id_devolucion_encabezado int(10)not null,
	cod_linea_devolucion_encabezado int(10)not null,
    fk_id_producto int(10)not null,
    fk_id_estado_producto int(10)not null,
    cantidad_devolucion_encabezado int(10)not null,
    iva_por_cobrar_devolucion_encabezado double(8,2)not null,/*ESTO LO CALCULA FINANZAS*/
    precio_unitario_devolucion_encabezado double(8,2)not null,
    subtotal_devolucion_encabezado double(12,2)not null,
    estado_devolucion_encabezado int(1)not null,
    primary key(fk_id_devolucion_encabezado,cod_linea_devolucion_encabezado),
    key(fk_id_devolucion_encabezado,cod_linea_devolucion_encabezado)
);
create table MOVIMIENTO_INVENTARIO(
	pk_id_movimiento_inventario int(10)not null,
    fecha_movimiento_inventario datetime not null,
    fk_id_tipo_movimiento int(10)not null,
	primary key(pk_id_movimiento_inventario),
    key(pk_id_movimiento_inventario)
);
create table TIPO_MOVIMIENTO(
	pk_id_tipo_movimiento int(10)not null,
    nombre_tipo_movimiento varchar(45)not null,
    signo_tipo varchar(1),
	primary key(pk_id_tipo_movimiento),
    key(pk_id_tipo_movimiento)
);
create table MOVIMIENTO_INVENTARIO_DETALLE(
	pk_id_movimiento_inventario_detalle int(10)not null,
    fk_id_movimiento_inventario int(10)not null,
    fk_id_producto int(10)not null,
	cantidad int(8)not null,
    origen varchar(35)not null,
    destino varchar(35)not null,
	primary key(pk_id_movimiento_inventario_detalle),
    key(pk_id_movimiento_inventario_detalle)
);
#-------HRM--------------------------------------------- 
CREATE TABLE IF NOT EXISTS GENERO (
  pk_id_genero 									INT NOT NULL,
  nombre_genero 								VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_genero)
  );
CREATE TABLE IF NOT EXISTS ESTADO_CIVIL (
  pk_id_estado_civil 							INT NOT NULL,
  nombre_estado_civil 							VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_estado_civil)
);  
CREATE TABLE IF NOT EXISTS LICENCIA_CONDUCCION (
  pk_id_licencia_conduccion 					INT NOT NULL,
  tipo_licencia_conduccion 						VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_licencia_conduccion)
);
CREATE TABLE IF NOT EXISTS TIPO_CONTRATO (
  pk_id_tipo_contrato 							INT NOT NULL,
  nombre_tipo_contrato 							VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_tipo_contrato)
);
CREATE TABLE IF NOT EXISTS CONTRATO (
  pk_id_contrato 								INT NOT NULL,
  nombre_contrato 								VARCHAR(45) NULL,
  fecha_suscripcion_contrato 					VARCHAR(10) NULL,
  fk_id_tipo_contrato 							INT NULL,
  PRIMARY KEY (pk_id_contrato)
);
CREATE TABLE IF NOT EXISTS HORARIO (
  pk_id_horario 								INT NOT NULL,
  nombre_horario 								VARCHAR(45) NULL,
  descripcion_horario 							VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_horario)
);
CREATE TABLE IF NOT EXISTS PUESTO (
  pk_id_puesto 									INT NOT NULL,
  nombre_puesto 								VARCHAR(45) NULL,
  salario_puesto 								DOUBLE NULL,
  fk_id_horario_puesto 							INT NULL,
  PRIMARY KEY (pk_id_puesto)
);
CREATE TABLE IF NOT EXISTS DEPARTAMENTO_EMPRESARIAL (
  pk_id__departamento_empresarial 				INT NOT NULL,
  nombre_departamento_empresarial 				VARCHAR(150) NULL,
  PRIMARY KEY (pk_id__departamento_empresarial)
);
CREATE TABLE IF NOT EXISTS EMPLEADO (
  pk_id_empleado 								INT NOT NULL,
  nombre1_empleado 								VARCHAR(45) NULL,
  nombre2_empleado 								VARCHAR(45) NULL,
  apellido1_empleado 							VARCHAR(45) NULL,
  apellido2_empleado 							VARCHAR(45) NULL,
  fecha_nacimiento_empleado 					VARCHAR(10) NULL,
  dpi_empleado 									INT NULL,
  fk_id_genero_empleado 						INT NULL,
  fk_id_estado_civil_empleado 					INT NULL,
  email_empleado 								VARCHAR(125) NULL,
  telefono_empleado 							INT NULL,
  numero_iggs_empleado							INT NULL,
  fk_id_licencia_conducir_empleado 				INT NULL,
  fk_id_contrato_empleado 						INT NULL,
  fk_id_puesto_empleado 						INT NULL,
  cuenta_bancaria_empleado 						INT NULL,
  fk_id_departamento_empresarial_empleado 		INT NULL,
  estado_empleado 								INT NULL,
  PRIMARY KEY (pk_id_empleado)
);
CREATE TABLE IF NOT EXISTS CURSO (
  pk_id_curso 									INT NOT NULL,
  nombre_curso 									VARCHAR(45) NULL,
  capacitador_curso 							VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_curso)
  );
CREATE TABLE IF NOT EXISTS ENCABEZADO_CAPACITACION (
  pk_id_encabezado_capacitacion 				INT NOT NULL,
  nombre_encabezado_capacitacion 				VARCHAR(45) NULL,
  fecha_inicio_encabezado_capacitacion 			VARCHAR(10) NULL,
  fecha_fin_encabezado_capacitacion 			VARCHAR(10) NULL,
  fk_id_curso_encabezado_capacitacion 			INT NULL,
  PRIMARY KEY (pk_id_encabezado_capacitacion)
);
CREATE TABLE IF NOT EXISTS TIPO_COMPETENCIA (
  pk_id_competencia 							INT NOT NULL,
  nombre_competencia 							VARCHAR(150) NULL,
  PRIMARY KEY (pk_id_competencia)
);
CREATE TABLE IF NOT EXISTS COMPETENCIA_DESARROLLO (
  pk_id_encabezado_desarrollo 					INT NOT NULL,
  fk_id_empleado_encabezado_desarrollo 			INT NULL,
  fecha_inicio_encabezado_desarrollo 			VARCHAR(10) NULL,
  fecha_fin_encabezado_desarrollo 				VARCHAR(10) NULL,
  fk_id_competencia_encabezado_desarrollo 		INT NULL,
  resultado_competencia_encabezado_desarrollo 	INT NULL,
  PRIMARY KEY (pk_id_encabezado_desarrollo)
);
CREATE TABLE IF NOT EXISTS FORMACION_ACADEMICA (
  pk_id_formacion_academica 					INT NOT NULL,
  nombre_formacion_academica 					VARCHAR(50) NULL,
  PRIMARY KEY (pk_id_formacion_academica)
);
CREATE TABLE IF NOT EXISTS TIPO_ENTREVISTA (
  pk_id_tipo_entrevista 						INT NOT NULL,
  nombre_tipo_entrevista 						VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_tipo_entrevista)
);
CREATE TABLE IF NOT EXISTS RECLUTAMIENTO (
  pk_id_reclutamiento 							INT NOT NULL,
  fk_id_empleado_reclutamiento 					INT NULL,
  fk_id_formacion_academica_reclutamiento 		INT NULL,
  nombre1_reclutamiento 						VARCHAR(45) NULL,
  nombre2_reclutamiento 						VARCHAR(45) NULL,
  apellido1_reclutamiento 						VARCHAR(45) NULL,
  apellido2_reclutamiento 						VARCHAR(45) NULL,
  fecha_nacimiento_reclutamiento 				VARCHAR(10) NULL,
  dpi_reclutamiento 							INT NULL,
  fk_id_genero_reclutamiento 					INT NULL,
  fk_id_estado_civil_reclutamiento 				INT NULL,
  email_reclutamiento 							VARCHAR(125) NULL,
  telefono_reclutamiento 						INT NULL,
  numero_igss_reclutamiento						INT NULL,
  fk_id_licencia_conducir_reclutamiento 		INT NULL,
  fk_id_puesto_reclutamiento 					INT NULL,
  estado_reclutado_entrevista 					INT NULL,
  fk_id_departamento_empresarial_reclutamiento 	INT NULL,
  PRIMARY KEY (pk_id_reclutamiento)
);
create table if not exists DIRECCION(
	pk_id_direccion 							int not null,
    departamento_direccion 						varchar(45),
    zona_direccion 								varchar(7),
    municipio_direccion 						varchar(100),
    residencia_direccion						varchar(45),
    fk_empleado_direccion						int null,
    fk_reclutamiento_direccion					int null,
    primary key(pk_id_direccion)
);
CREATE TABLE IF NOT EXISTS CAPACITACION (
  pk_id_capacitacion 							INT NOT NULL,
  fk_id_encabezado_capacitacion 				INT NULL,
  fk_id_empleado_capacitacion 					INT NULL,
  resultado_capacitacion 						VARCHAR(5) NULL,
  PRIMARY KEY (pk_id_capacitacion)
);
CREATE TABLE IF NOT EXISTS FALTA (
  pk_id_falta 									INT NOT NULL,
  nombre_falta 									VARCHAR(45) NULL,
  descripción_falta 							VARCHAR(45) NULL,
  PRIMARY KEY (pk_id_falta)
);
CREATE TABLE IF NOT EXISTS FALTA_EMPLEADO (
  pk_id_falta_empleado 							INT NOT NULL,
  fk_id_empleado_falta_empleado 				INT NULL,
  fk_id_tipo_falta_empleado 					INT NULL,
  fecha_falta_empleado 							VARCHAR(10) NULL
);
CREATE TABLE IF NOT EXISTS ENCABEZADO_NOMINA (
  pk_id_encabezado_nomina 						INT NOT NULL,
  nombre_encabezado_nomina 						VARCHAR(45) NULL,
  fecha_inicio_encabezado_nomina 				VARCHAR(10) NULL,
  fecha_fin_encabezado_nomina 					VARCHAR(10) NULL,
  PRIMARY KEY (pk_id_encabezado_nomina)
);
CREATE TABLE IF NOT EXISTS PERCEPCION (
  pk_id_percepcion 								INT NOT NULL,
  nombre_percepcion 							VARCHAR(45) NULL,
  monto_percepcion 								DOUBLE NULL,
  descripcion_percepcion 						VARCHAR(150) NULL,
  PRIMARY KEY (pk_id_percepcion)
);
CREATE TABLE IF NOT EXISTS DEDUCCION (
  pk_id_deduccion 								INT NOT NULL,
  nombre_deduccion 								VARCHAR(45) NULL,
  monto_deduccion 								DOUBLE NULL,
  descripcion_deduccion 						VARCHAR(150) NULL,
  PRIMARY KEY (pk_id_deduccion)
);
CREATE TABLE IF NOT EXISTS DETALLE_NOMINA (
  pk_id_detalle_nomina 							INT NOT NULL,
  fk_id_encabezado_detalle_nomina 				INT NULL,
  fk_id_empleado_detalle_nomina 				INT NULL,
  fk_id_percepciones_detalle_nomina 			INT NULL,
  fk_id_deducciones_detalle_nomina 				INT NULL,
  salario_base_detalle_nomina 					DOUBLE NULL,
  PRIMARY KEY (pk_id_detalle_nomina)
);
CREATE TABLE IF NOT EXISTS ENTREVISTA (
  pk_id_entrevista 								INT NOT NULL,
  fk_id_empleado_entrevista 					INT NULL,
  fk_id_reclutamiento_entrevista 				INT NULL,
  fk_id_tipo_entrevista 						INT NULL,
  resultado_entrevista 							INT NULL,
  comentarios_entrevistador_entrevista 			VARCHAR(200) NULL,
  PRIMARY KEY (pk_id_entrevista)
);
#-------CONSULTAS INTELIGENTES---------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTA_INTELIGENTE (
  pk_id_consulta_inteligente 					INT NOT NULL,
  nombre_consulta_inteligente 					VARCHAR(100) NULL,
  contenido_consulta_inteligente 				VARCHAR(250) NULL,
  PRIMARY KEY (pk_id_consulta_inteligente)
);
CREATE TABLE IF NOT EXISTS DETALLE_CONSULTA_INTELIGENTE (
  pk_id_detalle_consulta_inteligente 			INT NOT NULL,
  fk_id_empleado_detalle_consulta_inteligente 	INT NULL,
  fk_id_consulta_detalle_consulta_inteligente 	INT NULL,
  PRIMARY KEY (pk_id_detalle_consulta_inteligente)
);


#-------ALTER TABLE REPORTEADOR-------------------------------------
alter table REPORTE_MODULO add constraint fk_reporte_de_modulo foreign key(fk_id_reporte) references REPORTE(pk_id_reporte);
alter table REPORTE_MODULO add constraint fk_reporte_de_modulo_reportes foreign key(fk_id_modulo) references MODULO(pk_id_modulo);
alter table REPORTE_APLICATIVO add constraint fk_reporte_aplicativo_reporte foreign key(fk_id_reporte) references REPORTE(pk_id_reporte);
alter table REPORTE_APLICATIVO add constraint fk_reporte_aplicativo_modulo foreign key(fk_id_modulo) references MODULO(pk_id_modulo);
alter table REPORTE_APLICATIVO add constraint fk_report_aplicativo foreign key(fk_id_aplicacion) references APLICACION(pk_id_aplicacion);


#-------OBJETO CONSULTAS INTELIGENTES--------------------------------------------- 
alter table DETALLE_CONSULTA_INTELIGENTE add CONSTRAINT fk_empleado_detalle_consulta_inteligente FOREIGN KEY (fk_id_empleado_detalle_consulta_inteligente) REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table DETALLE_CONSULTA_INTELIGENTE add CONSTRAINT fk_consulta_detalle_consulta_inteligente FOREIGN KEY (fk_id_consulta_detalle_consulta_inteligente) REFERENCES CONSULTA_INTELIGENTE (pk_id_consulta_inteligente) ON DELETE RESTRICT ON UPDATE CASCADE;

#-------OBJETO SEGURIDAD---------------------------------------------------------- 
alter table APLICACION_PERFIL add constraint fk_aplicacionperfil_aplicacion foreign key (fk_idaplicacion_aplicacion_perfil) references APLICACION(pk_id_aplicacion)on delete restrict on update cascade;
alter table APLICACION_PERFIL add constraint fk_aplicacionperfil_perfil foreign key (fk_idperfil_aplicacion_perfil) references PERFIL(pk_id_perfil)on delete restrict on update cascade;
alter table APLICACION_PERFIL add constraint fk_aplicacionperfil_permiso foreign key (fk_idpermiso_aplicacion_perfil) references PERMISO (pk_id_permiso)on delete restrict on update cascade;
alter table PERFIL_USUARIO add constraint fk_perfil_usuario_login foreign key(fk_idusuario_perfil_usuario) references LOGIN(pk_id_login) on delete restrict on update cascade;
alter table PERFIL_USUARIO add constraint fk_perfil_usuario_perfil foreign key (fk_idperfil_perfil_usuario) references PERFIL(pk_id_perfil) on delete restrict on update cascade;

alter table APLICACION_USUARIO add constraint fk_aplicacionusuario_login foreign key(fk_idlogin_aplicacion_usuario) references LOGIN(pk_id_login) on delete restrict on update cascade;
alter table APLICACION_USUARIO add constraint fk_aplicacionusuario_aplicacion foreign key (fk_idaplicacion_aplicacion_usuario) references APLICACION(pk_id_aplicacion) on delete restrict on update cascade;
alter table APLICACION_USUARIO add constraint fk_aplicacionusuario_permiso foreign key(fk_idpermiso_aplicacion_usuario) references PERMISO (pk_id_permiso)on delete restrict on update cascade;

alter table BITACORA add constraint fk_login_bitacora foreign key (fk_idusuario_bitacora) references LOGIN (pk_id_login) on delete restrict on update cascade;
alter table BITACORA add constraint fk_aplicacion_bitacora foreign key (fk_idaplicacion_bitacora) references APLICACION(pk_id_aplicacion) on delete restrict on update cascade;
alter table DETALLE_BITACORA add constraint fk_bitacora_detallebitacora foreign key(fk_idbitacora_detalle_bitacora) references BITACORA(pk_id_bitacora) on delete restrict on update cascade;
alter table APLICACION add constraint fk_aplicativo_modulo foreign key(fk_id_modulo) references MODULO(pk_id_modulo);

#-------ALTER TABLE CRM---------------------------------------------  
ALTER TABLE PRODUCTO ADD CONSTRAINT fk_producto_categoriatamaño1 FOREIGN KEY (fk_idcategoriatamaño) REFERENCES CATEGORIA_TAMAÑO (pk_idcategoriatamaño) on delete no action on update no action;
ALTER TABLE PRODUCTO ADD CONSTRAINT fk_producto_categoriatipo1 FOREIGN KEY (fk_idcategoriatipo) REFERENCES CATEGORIA_TIPO (pk_idcategoriatipo) on delete no action on update no action;
ALTER TABLE VENTA ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (fk_idcliente) REFERENCES CLIENTE (pk_idcliente) on delete no action on update no action;
ALTER TABLE VENTA ADD CONSTRAINT fk_venta_producto1 FOREIGN KEY (fk_idproducto) REFERENCES PRODUCTO (pk_idproducto) on delete no action on update no action;
ALTER TABLE FACTURA ADD CONSTRAINT fk_factura_modopago1 FOREIGN KEY (fk_idmodopago) REFERENCES MODO_DE_PAGO (pk_idmodopago) on delete no action on update no action;
ALTER TABLE FACTURA ADD CONSTRAINT fk_factura_cliente1 FOREIGN KEY (fk_idcliente) REFERENCES CLIENTE (pk_idcliente) on delete no action on update no action;
ALTER TABLE CUENTAS_POR_COBRAR ADD CONSTRAINT fk_cuentasporcobrar_factura1 FOREIGN KEY (fk_idfactura) REFERENCES FACTURA (pk_idfactura) on delete no action on update no action;
ALTER TABLE CUENTAS_POR_COBRAR ADD CONSTRAINT fk_cuentasporcobrar_cliente1 FOREIGN KEY (fk_idcliente) REFERENCES CLIENTE (pk_idcliente) on delete no action on update no action;
ALTER TABLE INVENTARIOCRM ADD CONSTRAINT fk_inventario_producto1 FOREIGN KEY (fk_idproducto) REFERENCES PRODUCTO (pk_idproducto) on delete no action on update no action;
ALTER TABLE CORREO_CLIENTE ADD CONSTRAINT fk_direccionCliente_cliente1 FOREIGN KEY (fk_idcliente) REFERENCES CLIENTE (pk_idcliente) on delete no action on update no action;
ALTER TABLE TELEFONO_CLIENTE ADD CONSTRAINT fk_telefono_cliente1 FOREIGN KEY (fk_idcliente) REFERENCES CLIENTE (pk_idcliente) on delete no action on update no action;

ALTER TABLE CONTROL_EMPLEADO ADD CONSTRAINT fk_CONTROL_EMPLEADO_VENTA1 FOREIGN KEY (fk_idventa) REFERENCES VENTA (pk_idventa) on delete no action on update no action;
ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT fk_DETALLE_FACTURA_FACTURA1 FOREIGN KEY (fk_idfactura) REFERENCES FACTURA (pk_idfactura) on delete no action on update no action;
ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT fk_DETALLE_FACTURA_PRODUCTO1 FOREIGN KEY (fk_idproducto) REFERENCES PRODUCTO (pk_idproducto) on delete no action on update no action;

#-------ALTER TABLE MRP--------------------------------------------- 
alter table CONTROLCALIDAD add constraint fk_CONTROLCALIDAD_ORDENPRODUCCION1 foreign key (fk_idordenproduccion_controlcalidad) references ORDENPRODUCCION (pk_id_ordenproduccion)on delete no action on update no action;
alter table CONTROLCALIDAD add constraint fk_CONTROLCALIDAD_INVENTARIO1 foreign key (fk_idinventario_controlcalidad) references INVENTARIOMRP (pk_id_inventario) on delete no action on update no action;

alter table CONTROLPRODUCTO add constraint fk_CONTROLPRODUCTO_ORDENPRODUCCION1 foreign key (fk_idordenproduccion_controlproducto) references ORDENPRODUCCION (pk_id_ordenproduccion)on delete no action on update no action;
alter table CONTROLPRODUCTO add constraint fk_CONTROLPRODUCTO_ESTADOPRODUCCION foreign key (fk_idestadoproduccion_controlproducto) references ESTADOPRODUCCION (pk_id_estadoproduccion) on delete no action on update no action;

alter table HORAEMPLEADO add constraint fk_HORAEMPLEADO_ORDENPRODUCCION1 foreign key (fk_idordenproduccion_horaempleado) references ORDENPRODUCCION (pk_id_ordenproduccion) on delete no action on update no action;

alter table INVENTARIOMRP add constraint fk_INVENTARIO_MATERIAPRIMAINSUMO foreign key (fk_idmateriaprimainsumo_inventario) references MATERIAPRIMAINSUMO (pk_id_materiaprimainsumo) on delete no action on update no action;
alter table INVENTARIOMRP add constraint fk_INVENTARIO_TIPOINVENTARIO foreign key (fk_idtipoinventario_inventario) references TIPOINVENTARIO(pk_id_tipoinventario) on delete no action on update no action;

alter table ORDENCOMPRA add constraint fk_ORDENCOMPRA_MATERIAPRIMAINSUMO foreign key (fk_idmateriaprimainsumos_ordencompra) references MATERIAPRIMAINSUMO (pk_id_materiaprimainsumo) on delete no action on update no action;

alter table ORDENPRODUCCION add constraint fk_ORDENPRODUCCION_TIPOINVENTARIO foreign key (fk_idtipoproducto_idordenproduccion) references TIPOINVENTARIO (pk_id_tipoinventario) on delete no action on update no action;

alter table PRODUCTODETALLE add constraint fk_PRODUCTODETALLE_TIPOPRODUCTOENCABEZADO foreign key (fk_idtipoproductoencabezado_productodetalle) references TIPOPRODUCTOENCABEZADO(pk_id_tipoproductoencabezado) on delete no action on update no action;
alter table PRODUCTODETALLE add constraint fk_PRODUCTODETALLE_MATERIAPRIMAINSUMO foreign key (fk_idmateriaprimainsumo_productodetalle) references MATERIAPRIMAINSUMO(pk_id_materiaprimainsumo) on delete no action on update no action;

#-------ALTER TABLE FRM--------------------------------------------- 
ALTER TABLE PRESUPUESTO ADD CONSTRAINT fk_presupuesto_tipomoneda FOREIGN KEY (fk_idtipomoneda) REFERENCES TIPO_MONEDA(pk_idtipomoneda)on delete no action on update no action;
ALTER TABLE PRESUPUESTO ADD CONSTRAINT fk_presupuesto_area FOREIGN KEY (fk_area) REFERENCES AREA (pk_idarea)on delete no action on update no action;
ALTER TABLE CUENTA_BANCARIA ADD CONSTRAINT fk_cuentabancaria_banco FOREIGN KEY (fk_idbanco) REFERENCES BANCO (pk_idbanco)on delete no action on update no action;
ALTER TABLE CUENTA_BANCARIA ADD CONSTRAINT fk_cuentabancaria_propietario FOREIGN KEY (fk_idpropietario) REFERENCES PROPIETARIO (pk_idpropietario)on delete no action on update no action;
ALTER TABLE CUENTA_BANCARIA ADD CONSTRAINT fk_cuentabancaria_tipomoneda FOREIGN KEY (fk_idtipomoneda) REFERENCES TIPO_MONEDA (pk_idtipomoneda)on delete no action on update no action;
ALTER TABLE ENCABEZADO_TRANSACCION ADD CONSTRAINT fk_encabezadotransaccion_numerocuenta FOREIGN KEY (fk_idnumerocuenta) REFERENCES CUENTA_BANCARIA (pk_idnumerocuenta)on delete no action on update no action;
ALTER TABLE DETALLE_TRANSACCION ADD CONSTRAINT fk_detalle_encabezado FOREIGN KEY (fk_idencabezadotransaccion) REFERENCES ENCABEZADO_TRANSACCION (pk_idencabezadotransaccion)on delete no action on update no action;
ALTER TABLE DETALLE_TRANSACCION ADD CONSTRAINT fk_detalle_tipotransaccion FOREIGN KEY (fk_idtipotransaccion) REFERENCES TIPO_TRANSACCION (pk_idtipotransaccion)on delete no action on update no action;
ALTER TABLE CUENTA_CONTABLE ADD CONSTRAINT fk_cuentapadre_cuentahijo FOREIGN KEY (fk_cuentapadre) REFERENCES CUENTA_CONTABLE(pk_idcuenta)on delete no action on update no action;
ALTER TABLE SALDO_HISTORICO ADD CONSTRAINT fk_saldo_cuenta FOREIGN KEY (pk_idcuenta) REFERENCES CUENTA_CONTABLE (pk_idcuenta)on delete no action on update no action;
ALTER TABLE DIARIO_DETALLE ADD CONSTRAINT fk_diariodetalle_encabezado FOREIGN KEY (pk_polizaencabezado) REFERENCES DIARIO_ENCABEZADO (pk_polizaencabezado)on delete no action on update no action;
ALTER TABLE DIARIO_DETALLE ADD CONSTRAINT fk_diariodetalle_cuenta FOREIGN KEY (pk_idcuenta) REFERENCES CUENTA_CONTABLE (pk_idcuenta)on delete no action on update no action;
ALTER TABLE MAYOR_ENCABEZADO ADD CONSTRAINT fk_mayorencabezado_cuenta FOREIGN KEY (pk_idcuenta) REFERENCES CUENTA_CONTABLE (pk_idcuenta)on delete no action on update no action;
ALTER TABLE MAYOR_DETALLE ADD CONSTRAINT fk_mayorencabezado_polizaencabezado FOREIGN KEY (pk_polizaencabezado) REFERENCES DIARIO_ENCABEZADO (pk_polizaencabezado)on delete no action on update no action;
ALTER TABLE MAYOR_DETALLE ADD CONSTRAINT fk_mayorencabezado_detallemayor FOREIGN KEY (pk_idmayorencabezado) REFERENCES MAYOR_ENCABEZADO (pk_idmayorencabezado)on delete no action on update no action;
ALTER TABLE BALANCE_DETALLE ADD CONSTRAINT fk_balanceencabezado_detalle FOREIGN KEY (pk_idbalanceencabezado) REFERENCES BALANCE_ENCABEZADO (pk_idbalanceencabezado)on delete no action on update no action;
ALTER TABLE BALANCE_DETALLE ADD CONSTRAINT fk_balancedetalle_cuenta FOREIGN KEY (pk_idcuenta) REFERENCES CUENTA_CONTABLE (pk_idcuenta)on delete no action on update no action;

#-------ALTER TABLE SCM--------------------------------------------- 
alter table MOVIMIENTO_INVENTARIO add constraint fk_mov_inventario_tipo foreign key(fk_id_tipo_movimiento) references TIPO_MOVIMIENTO(pk_id_tipo_movimiento);
alter table MOVIMIENTO_INVENTARIO_DETALLE add constraint fk_mov_inventario_detalle_mov foreign key(fk_id_movimiento_inventario) references MOVIMIENTO_INVENTARIO(pk_id_movimiento_inventario);
alter table MOVIMIENTO_INVENTARIO_DETALLE add constraint fk_mov_inventario_detalle_producto foreign key(fk_id_producto) references PRODUCTOSCM(pk_id_producto);
alter table DEVOLUCION_DETALLE add constraint fk_devolucionDetalle_encabezado foreign key(fk_id_devolucion_encabezado) references DEVOLUCION_ENCABEZADO(pk_id_devolucion_encabezado);
alter table DEVOLUCION_DETALLE add constraint fk_devolucion_producto foreign key(fk_id_producto) references PRODUCTOSCM(pk_id_producto);
alter table DEVOLUCION_DETALLE add constraint fk_devolucion_Estadoproducto foreign key(fk_id_estado_producto) references ESTADO_PRODUCTO(pk_id_estado_producto);

alter table INVENTARIO add constraint fk_inventario_producto foreign key(fk_id_producto) references PRODUCTOSCM(pk_id_producto);
alter table INVENTARIO add constraint fk_inventario_bodega foreign key(fk_id_bodega) references BODEGA(pk_id_bodega);
alter table PRODUCTOSCM add constraint fk_producto_lineaProducto foreign key(fk_id_linea_producto) references LINEA_PRODUCTO(pk_id_linea_producto);
alter table PRODUCTOSCM add constraint fk_producto_categoriaProducto foreign key(fk_id_categoria_producto) references CATEGORIA_PRODUCTO(pk_id_categoria_producto);
alter table PROVEEDOR add constraint fk_proveedor_pais foreign key(fk_id_pais) references PAIS(pk_id_pais);

alter table TELEFONO_PROVEEDOR add constraint fk_proveedor_telefono foreign key(fk_id_proveedor) references PROVEEDOR(pk_id_proveedor);
alter table CORREO_PROVEEDOR add constraint fk_proveedor_correo foreign key(fk_id_proveedor) references PROVEEDOR(pk_id_proveedor);
alter table DEVOLUCION_ENCABEZADO add constraint fk_devolucion_fabrica foreign key(fk_id_fabrica) references FABRICA(pk_id_fabrica);
alter table DEVOLUCION_ENCABEZADO add constraint fk_devolucion_categoria foreign key(fk_id_categoria_producto) references CATEGORIA_PRODUCTO(pk_id_categoria_producto);
alter table PEDIDO_DETALLE add constraint fk_encabezado_pedido foreign key(fk_id_pedido_encabezado) references PEDIDO_ENCABEZADO(pk_id_pedido_encabezado);
alter table PEDIDO_DETALLE add constraint fk_pedido_producto foreign key(fk_id_producto) references PRODUCTOSCM(pk_id_producto);
alter table PEDIDO_ENCABEZADO add constraint fk_pedido_fabrica foreign key(fk_id_fabrica) references FABRICA(pk_id_fabrica);
alter table FABRICA add constraint fk_fabrica_municipio foreign key(fk_id_municipio) references MUNICIPIO(pk_id_municipio);
alter table COMPRA_DETALLE add constraint fk_compra_detalle foreign key(fk_id_compra_encabezado) references COMPRA_ENCABEZADO(pk_id_compra_encabezado);
alter table COMPRA_DETALLE add constraint fk_compra_producto foreign key(fk_id_producto) references PRODUCTOSCM(pk_id_producto);
alter table COMPRA_ENCABEZADO add constraint fk_compra_proveedor foreign key(fk_id_proveedor) references PROVEEDOR(pk_id_proveedor);

alter table BODEGA add constraint fk_bodega_municipio foreign key(fk_id_municipio) references MUNICIPIO(pk_id_municipio);
alter table ENCARGADO_BODEGA add constraint fk_empleado_encargado foreign key(fk_id_empleado) references EMPLEADO(pk_id_empleado);
alter table ENCARGADO_BODEGA add constraint fk_empleado_bodega1 foreign key(fk_id_bodega) references BODEGA(pk_id_bodega);
alter table MUNICIPIO add constraint fk_municipio_departamento foreign key(fk_id_departamento) references DEPARTAMENTO(pk_id_departamento);

alter table ENVIO_PRODUCTO add constraint fk_envio_producto_vehiculo foreign key(fk_id_vehiculo) references VEHICULO(pk_id_vehiculo);
alter table VEHICULO add constraint fk_vehiculo_marca foreign key(fk_id_marca) references MARCA (pk_id_marca);
alter table SUCURSAL add constraint fk_sucursal_municipio foreign key(fk_id_municipio) references MUNICIPIO(pk_id_municipio);

alter table ENVIO_PRODUCTO add constraint fk_envio_producto foreign key(fk_id_producto) references PRODUCTOSCM(pk_id_producto);
alter table ENVIO_PRODUCTO add constraint fk_envio_empleado foreign key(fk_id_empleado) references EMPLEADO(pk_id_empleado);
alter table ENVIO_PRODUCTO add constraint fk_envio_ruta foreign key(fk_id_ruta) references RUTA(pk_id_ruta);

#-------ALTER TABLE HRM--------------------------------------------- 
alter table CONTRATO add constraint fk_tipo_contrato foreign key (fk_id_tipo_contrato) references TIPO_CONTRATO (pk_id_tipo_contrato) on delete restrict on update cascade;
alter table PUESTO add constraint fk_horario_puesto foreign key (fk_id_horario_puesto) references HORARIO (pk_id_horario) on delete restrict on update cascade;
alter table EMPLEADO add constraint fk_genero_empleado1 foreign key (fk_id_genero_empleado) references GENERO(pk_id_genero) on delete restrict on update cascade;
alter table EMPLEADO add CONSTRAINT fk_estado_civil_empleado FOREIGN KEY (fk_id_estado_civil_empleado) REFERENCES ESTADO_CIVIL (pk_id_estado_civil) on delete restrict on update cascade;
alter table EMPLEADO add CONSTRAINT fk_licencia_conducir_empleado FOREIGN KEY (fk_id_licencia_conducir_empleado) REFERENCES LICENCIA_CONDUCCION (pk_id_licencia_conduccion) on delete restrict on update cascade;
alter table EMPLEADO add CONSTRAINT fk_contrato_empleado FOREIGN KEY (fk_id_contrato_empleado) REFERENCES CONTRATO (pk_id_contrato) on delete restrict on update cascade;
alter table EMPLEADO add CONSTRAINT fk_puesto_empleado FOREIGN KEY (fk_id_puesto_empleado) REFERENCES PUESTO (pk_id_puesto) on delete restrict on update cascade;
alter table EMPLEADO add CONSTRAINT fk_departamento_empresarial_empleado FOREIGN KEY (fk_id_departamento_empresarial_empleado) REFERENCES DEPARTAMENTO_EMPRESARIAL (pk_id__departamento_empresarial) on delete restrict on update cascade;

alter table DIRECCION add constraint fk_empleado_direccion foreign key (fk_empleado_direccion) references EMPLEADO (pk_id_empleado) on delete restrict on update cascade;
alter table DIRECCION add constraint fk_reclutamiento_direccion foreign key (fk_reclutamiento_direccion) REFERENCES RECLUTAMIENTO (pk_id_reclutamiento) on delete restrict on update cascade;

alter table ENCABEZADO_CAPACITACION add CONSTRAINT fk_curso_encabezado_capacitacion FOREIGN KEY (fk_id_curso_encabezado_capacitacion) REFERENCES CURSO (pk_id_curso) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table COMPETENCIA_DESARROLLO add CONSTRAINT fk_empleado_encabezado_desarrollo FOREIGN KEY (fk_id_empleado_encabezado_desarrollo) REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table COMPETENCIA_DESARROLLO add CONSTRAINT fk_competencia_encabezado_desarrollo FOREIGN KEY (fk_id_competencia_encabezado_desarrollo) REFERENCES TIPO_COMPETENCIA (pk_id_competencia) ON DELETE RESTRICT on UPDATE CASCADE;

alter table RECLUTAMIENTO add CONSTRAINT fk_empleado_reclutamiento FOREIGN KEY (fk_id_empleado_reclutamiento) REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table RECLUTAMIENTO add CONSTRAINT fk_formacion_academica_reclutamiento FOREIGN KEY (fk_id_formacion_academica_reclutamiento) REFERENCES FORMACION_ACADEMICA (pk_id_formacion_academica) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table RECLUTAMIENTO add CONSTRAINT fk_genero_reclutamiento FOREIGN KEY (fk_id_genero_reclutamiento) REFERENCES GENERO (pk_id_genero) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table RECLUTAMIENTO add CONSTRAINT fk_estado_civil_reclutamiento FOREIGN KEY (fk_id_estado_civil_reclutamiento) REFERENCES ESTADO_CIVIL (pk_id_estado_civil) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table RECLUTAMIENTO add CONSTRAINT fk_licencia_conducir_reclutamiento FOREIGN KEY (fk_id_licencia_conducir_reclutamiento) REFERENCES LICENCIA_CONDUCCION (pk_id_licencia_conduccion) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table RECLUTAMIENTO add CONSTRAINT fk_puesto_reclutamiento FOREIGN KEY (fk_id_puesto_reclutamiento) REFERENCES PUESTO (pk_id_puesto) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table RECLUTAMIENTO add CONSTRAINT fk_departamento_empresarial_reclutamiento FOREIGN KEY (fk_id_departamento_empresarial_reclutamiento) REFERENCES DEPARTAMENTO_EMPRESARIAL (pk_id__departamento_empresarial) ON DELETE RESTRICT ON UPDATE CASCADE;

alter table CAPACITACION add CONSTRAINT fk_encabezado_capacitacion FOREIGN KEY (fk_id_encabezado_capacitacion) REFERENCES ENCABEZADO_CAPACITACION (pk_id_encabezado_capacitacion) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table CAPACITACION add CONSTRAINT fk_empleado_capacitacion FOREIGN KEY (fk_id_empleado_capacitacion) REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;

alter table FALTA_EMPLEADO add CONSTRAINT fk_empleado_falta FOREIGN KEY (fk_id_empleado_falta_empleado)REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table FALTA_EMPLEADO add CONSTRAINT fk_tipo_falta FOREIGN KEY (fk_id_tipo_falta_empleado) REFERENCES FALTA (pk_id_falta) ON DELETE RESTRICT ON UPDATE CASCADE;

alter table DETALLE_NOMINA add CONSTRAINT fk_encabezado_detalle_nomina FOREIGN KEY (fk_id_encabezado_detalle_nomina) REFERENCES ENCABEZADO_NOMINA (pk_id_encabezado_nomina) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table DETALLE_NOMINA add CONSTRAINT fk_emplado_detalle_nomina FOREIGN KEY (fk_id_empleado_detalle_nomina) REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table DETALLE_NOMINA add CONSTRAINT fk_percepcion_detalle_nomina FOREIGN KEY (fk_id_percepciones_detalle_nomina) REFERENCES PERCEPCION (pk_id_percepcion) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table DETALLE_NOMINA add CONSTRAINT fk_deduccion_detalle_nomina FOREIGN KEY (fk_id_deducciones_detalle_nomina) REFERENCES DEDUCCION (pk_id_deduccion) ON DELETE RESTRICT ON UPDATE CASCADE;

alter table ENTREVISTA add CONSTRAINT fk_empleado_entrevista FOREIGN KEY (fk_id_empleado_entrevista) REFERENCES EMPLEADO (pk_id_empleado) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table ENTREVISTA add CONSTRAINT fk_reclutamiento_entrevista FOREIGN KEY (fk_id_reclutamiento_entrevista) REFERENCES RECLUTAMIENTO (pk_id_reclutamiento) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table ENTREVISTA add CONSTRAINT fk_tipo_entrevista FOREIGN KEY (fk_id_tipo_entrevista) REFERENCES TIPO_ENTREVISTA (pk_id_tipo_entrevista) ON DELETE RESTRICT ON UPDATE CASCADE;


##-------RELACIONES CON LOS MODULOS----------------------------------------------------------------------------------------------------------------------------------
 ALTER TABLE FACTURA ADD CONSTRAINT fk_FACTURA_EMPLEADO1 FOREIGN KEY (fK_idEMPLEADO) REFERENCES EMPLEADO (pk_id_empleado) on delete no action on update no action;
 ALTER TABLE CONTROL_EMPLEADO ADD CONSTRAINT fk_CONTROL_EMPLEADO_EMPLEADO1 FOREIGN KEY (fK_idEMPLEADO) REFERENCES EMPLEADO (pk_id_empleado) on delete no action on update no action;
 alter table CONTROLCALIDAD add constraint fk_EMPLEADOS_CONTROLCALIDAD1 foreign key (fk_idresponsable_controlcalidad) references EMPLEADO (pk_id_empleado)on delete no action on update no action; 
 alter table HORAEMPLEADO add constraint fk_HORAEMPLEADO_EMPLEADO foreign key (fk_idempleado_horaempleado)references EMPLEADO (Pk_id_empleado) on delete no action on update no action;
 
