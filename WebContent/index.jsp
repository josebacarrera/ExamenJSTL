<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/index.css">
<title>${title}</title>
</head>
<body>
<div class="elements-tree">
	<!--  ELEMENT LIST -->
	<div class="elements-list">
		<div class="row header">
			<a class="name <c:if test="${orderby == 'name'}">selected</c:if>" href="Explorar?id=${actual_element.id}&orderby=name&ascdesc=${ascdesc}"><span>Nombre</span></a>
			<a class="date <c:if test="${orderby == 'update_at'}">selected</c:if>" href="Explorar?id=${actual_element.id}&orderby=updated_at&ascdesc=${ascdesc}"><span>Fecha Modificacion</span></a>
		</div>
		
		<c:if test="${actual_element != null}">
			<div class="row">
				<a class="name" href="Explorar?id=${actual_element.parent_id}">
				<img class="icon" src="images/icons/folder_up.png"/>
				<span class="text">...</span>
				</a>
			</div>
		</c:if>
		
		<c:forEach items="${elements}" var="element">
			<div class="row">
				<a class="name" href="Explorar?id=${element.id}">

				<!-- para analizar si el tipo de elemento es CARPETA -->
				<c:if test="${element.type == 'carpeta'}">
					<img class="icon" src="images/icons/folder.png"/>
			
					<span class="text">${element.name}</span>
				</a>
				<div class="date">${element.updated_at}</div>
				<a class="action" href="Explorar?id=${element.parent_id}&action=delete&idtodelete=${element.id}">Eliminar??</a>
			</c:if>
			
				<!-- para analizar si el tipo de elemento es ARCHIVO -->
			<c:if test="${element.type == 'archivo'}">
					<img class="icon" src="images/icons/${element.extension}.png"/>			
					<span>${element.name}.${element.extension}</span>
				</a>
				<div class="date">${element.updated_at}</div>
				<a class="action" href="Explorar?id=${element.parent_id}&action=delete&idtodelete=${element.id}">Eliminar??</a>
				</c:if>								
				</a>				
			</div>
		</c:forEach>
	</div>
	
	
	<!-- INSERT FORM -->
	<form action="" method="POST">
		<div>
			Añadir nuevo:
		</div>
		<div>
			<label for="carpeta"><input type="radio" id="carpeta" name="newtype" value="carpeta"> Carpeta</label>
			<label for="archivo"><input type="radio" id="archivo" name="newtype" value="archivo"> Archivo</label>
		</div>
		<div>
		<input type="text" name="newname" value="" placeholder="Escribe el nombre..."><input type="submit">
			<!-- COMPLETAR area de texto y botón, pistas en index.css-->		
		</div>
	</form>
</div>

<!-- SEGUNDA COLUMNA -->
<div class="element-content">
	<div class="element-content-area">
	
		<!-- AQUI se debe mostrar el contenido de los fichero si es que lo tienen -->

	</div>
</div>



</body>
</html>