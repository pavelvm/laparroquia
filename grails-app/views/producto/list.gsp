
<%@ page import="com.yourapp.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-producto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'producto.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="nombreProducto" title="${message(code: 'producto.nombreProducto.label', default: 'Nombre Producto')}" />
					
						<g:sortableColumn property="tipoProducto" title="${message(code: 'producto.tipoProducto.label', default: 'Tipo Producto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productoInstanceList}" status="i" var="productoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productoInstance.id}">${fieldValue(bean: productoInstance, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: productoInstance, field: "nombreProducto")}</td>
					
						<td>${fieldValue(bean: productoInstance, field: "tipoProducto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
