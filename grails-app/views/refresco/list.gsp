
<%@ page import="com.yourapp.Refresco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refresco.label', default: 'Refresco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-refresco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-refresco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="refresco.almacen.label" default="Almacen" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'refresco.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'refresco.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="refresco.ventas.label" default="Ventas" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${refrescoInstanceList}" status="i" var="refrescoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${refrescoInstance.id}">${fieldValue(bean: refrescoInstance, field: "almacen")}</g:link></td>
					
						<td>${fieldValue(bean: refrescoInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: refrescoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: refrescoInstance, field: "ventas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${refrescoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
