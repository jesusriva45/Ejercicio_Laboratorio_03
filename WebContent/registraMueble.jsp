<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Registra Mueble</title>



<link rel="stylesheet" href="Bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="Bootstrap/css/bootstrapValidator.css">
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">

<script src="Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="Bootstrap/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="Bootstrap/js/bootstrapValidator.js" type="text/javascript"></script>


</head>
<body class="">



	<div class="container row m-5 col-sm-6 p-0">

		<h2 class="col-sm-12">Registrar Mueble</h2>
		<div class="col-xs-12">
			<hr>
		</div>

		<c:if test="${sessionScope.MENSAJE != null}">
			<div class="alert alert-${sessionScope.MESSAGE}  col-sm-4 m-auto p-1"
				id="success-alert">
				<h4 class="text-center mt-3 font-weight-bold">${sessionScope.MENSAJE}</h4>
			</div>
		</c:if>
		<c:remove var="MENSAJE" />

		<form action="MuebleServlet" class="col-sm-12" id="id_form">

			<div class="form-row ">

				<div class="form-group col-md-8 ">
					<label for="id_nombre">Nombre</label> <input type="text"
						class="form-control" id="id_nombre" name="nombre"
						placeholder="Nombre">

				</div>

				<div class="form-group col-md-4">
					<label class="control-label" for="id_material">Material</label> <select
						class="form-control" id="id_material" name="material">
						<option value="">Seleccione</option>
						<option value="Cedro">Cedro</option>
						<option value="Abedo">Abedo</option>
						<option value="Pino">Pino</option>
						<option value="Roble">Roble</option>
						<option value="Caoba">Caoba</option>
					</select>
				</div>
				<div class="form-group col-md-8">
					<label for="id_descripcion">Descripción</label>
					<textarea class="form-control" id="id_descripcion"
						name="descripcion" rows="3" cols=""></textarea>
				</div>

			<div class="form-group col-md-5 mb-3">
					<label for="id_stock">Stock</label> <input type="text"
						class="form-control" id="id_stock" name="stock"
						placeholder="0">
				</div><br>
			
				<div class="form-group col-md-5 mb-3 ml-auto">
					<label for="id_precio">Precio</label> <input type="text"
						class="form-control" id="id_precio" name="precio"
						placeholder="Precio">
				</div>
				
				

			</div>



			<button class="btn btn-primary" type="submit">Registrar</button>

		</form>

	</div>

	<script type="text/javascript">
		$("#success-alert").fadeTo(1000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(500);
		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#id_form')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													nombre : {
														selector : '#id_nombre',
														validators : {

															notEmpty : {
																message : "El nombre es obligatorio"
															},
															stringLength : {
																message : "El nombre es de 2 a 20 caracteres",
																min : 2,
																max : 20
															}
														}
													},
													material : {
														selector : '#id_material',
														validators : {
															notEmpty : {
																message : "El apellido es obligatorio"
															},
															stringLength : {
																message : "El apellido es de 2 a 20 caracteres",
																min : 2,
																max : 20
															}
														}
													},
													descripcion : {
														selector : '#id_descripcion',
														validators : {
															notEmpty : {
																message : "La descripción es obligatoria"
															},
															stringLength : {
																message : "La descripción es de 15 a 200 caracteres",
																min : 15,
																max : 200
															}
														}
													},
													precio : {
														selector : '#id_precio',
														validators : {
															notEmpty : {
																message : "El precio es obligatorio"
															},
															regexp : {
																regexp : /^[0-9]+([.][0-9]+)?$/,
																message : 'Formato incorrecto, solo enteros o decimales'
															},
															between : {
																min : 50,
																max : 9999999,
																message : 'Debe ingresar precio mayor o igual a 50'
															}
														}
													},
													stock : {
														selector : '#id_stock',
														validators : {
															notEmpty : {
																message : "El stock es obligatorio"
															},
															regexp : {
																regexp : /^[0]?[+]?[0-9]\d*$/,
																message : 'Formato incorrecto, solo enteros'
															},
															between : {
																min : 1,
																max : 99999,
																message : 'Stock debe ser mayor o igual a 1'
															}
														}
													}
												}

											});
							// Validate the form manually
							$('#validateBtn').click(function() {
								$('#id_form').bootstrapValidator('validate');
							});

						});
	</script>

</body>


</html>




