
<%@ page import="com.yourapp.Vino" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vino.label', default: 'Vino')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vino" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vino" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="vino.almacen.label" default="Almacen" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'vino.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="etiquetaVino" title="${message(code: 'vino.etiquetaVino.label', default: 'Etiqueta Vino')}" />
					
						<th><g:message code="vino.medida.label" default="Medida" /></th>
					
						<g:sortableColumn property="nombre" title="${message(code: 'vino.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="vino.ventas.label" default="Ventas" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vinoInstanceList}" status="i" var="vinoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vinoInstance.id}">${fieldValue(bean: vinoInstance, field: "almacen")}</g:link></td>
					
						<td>${fieldValue(bean: vinoInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: vinoInstance, field: "etiquetaVino")}</td>
					
						<td>${fieldValue(bean: vinoInstance, field: "medida")}</td>
					
						<td>${fieldValue(bean: vinoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: vinoInstance, field: "ventas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vinoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
