
<%@ page import="com.yourapp.Venta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-venta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-venta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list venta">
			
				<g:if test="${ventaInstance?.nombreCliente}">
				<li class="fieldcontain">
					<span id="nombreCliente-label" class="property-label"><g:message code="venta.nombreCliente.label" default="Nombre Cliente" /></span>
					
						<span class="property-value" aria-labelledby="nombreCliente-label"><g:fieldValue bean="${ventaInstance}" field="nombreCliente"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="venta.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${ventaInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.totalCuenta}">
				<li class="fieldcontain">
					<span id="totalCuenta-label" class="property-label"><g:message code="venta.totalCuenta.label" default="Total Cuenta" /></span>
					
						<span class="property-value" aria-labelledby="totalCuenta-label"><g:fieldValue bean="${ventaInstance}" field="totalCuenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.fechaVenta}">
				<li class="fieldcontain">
					<span id="fechaVenta-label" class="property-label"><g:message code="venta.fechaVenta.label" default="Fecha Venta" /></span>
					
						<span class="property-value" aria-labelledby="fechaVenta-label"><g:formatDate date="${ventaInstance?.fechaVenta}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.cervezas}">
				<li class="fieldcontain">
					<span id="cervezas-label" class="property-label"><g:message code="venta.cervezas.label" default="Cervezas" /></span>
					
						<g:each in="${ventaInstance.cervezas}" var="c">
						<span class="property-value" aria-labelledby="cervezas-label"><g:link controller="cerveza" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.descipcion}">
				<li class="fieldcontain">
					<span id="descipcion-label" class="property-label"><g:message code="venta.descipcion.label" default="Descipcion" /></span>
					
						<span class="property-value" aria-labelledby="descipcion-label"><g:fieldValue bean="${ventaInstance}" field="descipcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.refrescos}">
				<li class="fieldcontain">
					<span id="refrescos-label" class="property-label"><g:message code="venta.refrescos.label" default="Refrescos" /></span>
					
						<g:each in="${ventaInstance.refrescos}" var="r">
						<span class="property-value" aria-labelledby="refrescos-label"><g:link controller="refresco" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.vinos}">
				<li class="fieldcontain">
					<span id="vinos-label" class="property-label"><g:message code="venta.vinos.label" default="Vinos" /></span>
					
						<g:each in="${ventaInstance.vinos}" var="v">
						<span class="property-value" aria-labelledby="vinos-label"><g:link controller="vino" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ventaInstance?.id}" />
					<g:link class="edit" action="edit" id="${ventaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
