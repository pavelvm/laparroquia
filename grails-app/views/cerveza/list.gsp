
<%@ page import="com.yourapp.Cerveza" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cerveza.label', default: 'Cerveza')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cerveza" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cerveza" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="cerveza.almacen.label" default="Almacen" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'cerveza.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="medida" title="${message(code: 'cerveza.medida.label', default: 'Medida')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'cerveza.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="cerveza.ventas.label" default="Ventas" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cervezaInstanceList}" status="i" var="cervezaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cervezaInstance.id}">${fieldValue(bean: cervezaInstance, field: "almacen")}</g:link></td>
					
						<td>${fieldValue(bean: cervezaInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: cervezaInstance, field: "medida")}</td>
					
						<td>${fieldValue(bean: cervezaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: cervezaInstance, field: "ventas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cervezaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
