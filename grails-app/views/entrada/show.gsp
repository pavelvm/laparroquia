
<%@ page import="com.yourapp.Entrada" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-entrada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entrada">
			
				<g:if test="${entradaInstance?.bar}">
				<li class="fieldcontain">
					<span id="bar-label" class="property-label"><g:message code="entrada.bar.label" default="Bar" /></span>
					
						<span class="property-value" aria-labelledby="bar-label"><g:link controller="bar" action="show" id="${entradaInstance?.bar?.id}">${entradaInstance?.bar?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="entrada.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${entradaInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.cervezas}">
				<li class="fieldcontain">
					<span id="cervezas-label" class="property-label"><g:message code="entrada.cervezas.label" default="Cervezas" /></span>
					
						<g:each in="${entradaInstance.cervezas}" var="c">
						<span class="property-value" aria-labelledby="cervezas-label"><g:link controller="cerveza" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.etiquetaVino}">
				<li class="fieldcontain">
					<span id="etiquetaVino-label" class="property-label"><g:message code="entrada.etiquetaVino.label" default="Etiqueta Vino" /></span>
					
						<span class="property-value" aria-labelledby="etiquetaVino-label"><g:fieldValue bean="${entradaInstance}" field="etiquetaVino"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.precioCompra}">
				<li class="fieldcontain">
					<span id="precioCompra-label" class="property-label"><g:message code="entrada.precioCompra.label" default="Precio Compra" /></span>
					
						<span class="property-value" aria-labelledby="precioCompra-label"><g:fieldValue bean="${entradaInstance}" field="precioCompra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.precioUnitario}">
				<li class="fieldcontain">
					<span id="precioUnitario-label" class="property-label"><g:message code="entrada.precioUnitario.label" default="Precio Unitario" /></span>
					
						<span class="property-value" aria-labelledby="precioUnitario-label"><g:fieldValue bean="${entradaInstance}" field="precioUnitario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.precioVenta}">
				<li class="fieldcontain">
					<span id="precioVenta-label" class="property-label"><g:message code="entrada.precioVenta.label" default="Precio Venta" /></span>
					
						<span class="property-value" aria-labelledby="precioVenta-label"><g:fieldValue bean="${entradaInstance}" field="precioVenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="entrada.proveedor.label" default="Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${entradaInstance?.proveedor?.id}">${entradaInstance?.proveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.refrescos}">
				<li class="fieldcontain">
					<span id="refrescos-label" class="property-label"><g:message code="entrada.refrescos.label" default="Refrescos" /></span>
					
						<g:each in="${entradaInstance.refrescos}" var="r">
						<span class="property-value" aria-labelledby="refrescos-label"><g:link controller="refresco" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.vinos}">
				<li class="fieldcontain">
					<span id="vinos-label" class="property-label"><g:message code="entrada.vinos.label" default="Vinos" /></span>
					
						<g:each in="${entradaInstance.vinos}" var="v">
						<span class="property-value" aria-labelledby="vinos-label"><g:link controller="vino" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${entradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${entradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
