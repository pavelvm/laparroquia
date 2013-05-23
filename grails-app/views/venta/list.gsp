
<%@ page import="com.yourapp.Venta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>

			</ul>
		</div>
		<br>
		<g:form action="guardarNombre" >
			<label for="nombreCliente">
			<g:message code="venta.nombreCliente.label" default="Nombre Cliente" />
			<span class="required-indicator">*</span>
			</label>
			<g:textField name="nombreCliente" required="" value="${ventaInstance?.nombreCliente}"/>
			
				<g:submitButton name="createNombre"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</g:form>
		<br>

		<div id="list-venta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			

		






			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombreCliente" title="${message(code: 'venta.nombreCliente.label', default: 'Nombre Cliente')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'venta.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="totalCuenta" title="${message(code: 'venta.totalCuenta.label', default: 'Total Cuenta')}" />
					
						<g:sortableColumn property="fechaVenta" title="${message(code: 'venta.fechaVenta.label', default: 'Fecha Venta')}" />
					
						<g:sortableColumn property="descipcion" title="${message(code: 'venta.descipcion.label', default: 'Descipcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ventaInstanceList}" status="i" var="ventaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ventaInstance.id}">${fieldValue(bean: ventaInstance, field: "nombreCliente")}</g:link></td>
					
						<td>${fieldValue(bean: ventaInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: ventaInstance, field: "totalCuenta")}</td>
					
						<td><g:formatDate date="${ventaInstance.fechaVenta}" /></td>
					
						<td>${fieldValue(bean: ventaInstance, field: "descipcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ventaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
