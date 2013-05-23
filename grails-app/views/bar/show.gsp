
<%@ page import="com.yourapp.Bar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bar.label', default: 'Bar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bar">
			
				<g:if test="${barInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="bar.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${barInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.nombreBar}">
				<li class="fieldcontain">
					<span id="nombreBar-label" class="property-label"><g:message code="bar.nombreBar.label" default="Nombre Bar" /></span>
					
						<span class="property-value" aria-labelledby="nombreBar-label"><g:fieldValue bean="${barInstance}" field="nombreBar"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${barInstance?.id}" />
					<g:link class="edit" action="edit" id="${barInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
