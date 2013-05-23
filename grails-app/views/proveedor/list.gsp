
<%@ page import="com.yourapp.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="status" title="${message(code: 'proveedor.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'proveedor.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'proveedor.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proveedorInstanceList}" status="i" var="proveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proveedorInstance.id}">${fieldValue(bean: proveedorInstance, field: "status")}</g:link></td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proveedorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
