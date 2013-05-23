
<%@ page import="com.yourapp.Medida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medida.label', default: 'Medida')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medida" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="copasMinimas" title="${message(code: 'medida.copasMinimas.label', default: 'Copas Minimas')}" />
					
						<g:sortableColumn property="medida" title="${message(code: 'medida.medida.label', default: 'Medida')}" />
					
						<g:sortableColumn property="nombreDescripcion" title="${message(code: 'medida.nombreDescripcion.label', default: 'Nombre Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medidaInstanceList}" status="i" var="medidaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medidaInstance.id}">${fieldValue(bean: medidaInstance, field: "copasMinimas")}</g:link></td>
					
						<td>${fieldValue(bean: medidaInstance, field: "medida")}</td>
					
						<td>${fieldValue(bean: medidaInstance, field: "nombreDescripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medidaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
