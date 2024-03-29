
<%@ page import="com.yourapp.Bar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bar.label', default: 'Bar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="direccion" title="${message(code: 'bar.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="nombreBar" title="${message(code: 'bar.nombreBar.label', default: 'Nombre Bar')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${barInstanceList}" status="i" var="barInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${barInstance.id}">${fieldValue(bean: barInstance, field: "direccion")}</g:link></td>
					
						<td>${fieldValue(bean: barInstance, field: "nombreBar")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${barInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
