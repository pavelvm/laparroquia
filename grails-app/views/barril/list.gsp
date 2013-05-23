
<%@ page import="com.yourapp.Barril" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'barril.label', default: 'Barril')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-barril" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-barril" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'barril.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'barril.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="listrosBarril" title="${message(code: 'barril.listrosBarril.label', default: 'Listros Barril')}" />
					
						<g:sortableColumn property="pecio" title="${message(code: 'barril.pecio.label', default: 'Pecio')}" />
					
						<g:sortableColumn property="precioLitro" title="${message(code: 'barril.precioLitro.label', default: 'Precio Litro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${barrilInstanceList}" status="i" var="barrilInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${barrilInstance.id}">${fieldValue(bean: barrilInstance, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: barrilInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: barrilInstance, field: "listrosBarril")}</td>
					
						<td>${fieldValue(bean: barrilInstance, field: "pecio")}</td>
					
						<td>${fieldValue(bean: barrilInstance, field: "precioLitro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${barrilInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
