<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--
  ~ eGov suite of products aim to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) <2015>  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  --%>

	<div>
		<div>
			<div class="panel panel-primary" data-collapsed="0">
				<div class="panel-heading">
					<div class="panel-title">Asset</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<c:if test="${codeGenerationMode == 'Manual'}">
							<label class="col-sm-3 control-label text-right"><spring:message
									code="lbl.code" /> <span class="mandatory"></span> </label>
							<div class="col-sm-3 add-margin">
								<form:input path="code"
									class="form-control text-left patternvalidation"
									data-pattern="alphanumeric" maxlength="50" required="required" />
								<form:errors path="code" cssClass="error-msg" />
							</div>
						</c:if>
						<label class="col-sm-3 control-label text-right"><spring:message
								code="lbl.name" /> <span class="mandatory"></span> </label>
						<div class="col-sm-3 add-margin">
							<form:input path="name"
								class="form-control text-left patternvalidation"
								data-pattern="alphanumericwithspace" maxlength="256" required="required" />
							<form:errors path="name" cssClass="error-msg" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label text-right"><spring:message
								code="lbl.assetcategory" /> <span class="mandatory"></span> </label>
						<div class="col-sm-3 add-margin">
							<form:select path="assetCategory" id="assetCategory"
								onchange="loadCustomFields()" cssClass="form-control"
								required="required" cssErrorClass="form-control error">
								<form:option value="">
									<spring:message code="lbl.select" />
								</form:option>
								<form:options items="${assetCategorys}" itemValue="id"
									itemLabel="name" />
							</form:select>
							<form:errors path="assetCategory" cssClass="error-msg" />
						</div>
						<label class="col-sm-2 control-label text-right"><spring:message
								code="lbl.department" /> </label>
						<div class="col-sm-3 add-margin">
							<form:select path="department" id="department"
								cssClass="form-control" cssErrorClass="form-control error">
								<form:option value="">
									<spring:message code="lbl.select" />
								</form:option>
								<form:options items="${departments}" itemValue="id"
									itemLabel="name" />
							</form:select>
							<form:errors path="department" cssClass="error-msg" />
						</div>
					</div>
					<%-- <div class="form-group">
						<label class="col-sm-3 control-label text-right"><spring:message
								code="lbl.area" /> <span class="mandatory"></span> </label>
						<div class="col-sm-3 add-margin">
							<form:select path="area" id="area" cssClass="form-control"
								cssErrorClass="form-control error">
								<form:option value="">
									<spring:message code="lbl.select" />
								</form:option>
								<form:options items="${boundarys}" itemValue="id"
									itemLabel="name" />
							</form:select>
							<form:errors path="area" cssClass="error-msg" />
						</div>
						<label class="col-sm-3 control-label text-right"><spring:message
								code="lbl.location" /> </label>
						<div class="col-sm-3 add-margin">
							<form:select path="location" id="location"
								cssClass="form-control" cssErrorClass="form-control error">
								<form:option value="">
									<spring:message code="lbl.select" />
								</form:option>
								<form:options items="${boundarys}" itemValue="id"
									itemLabel="name" />
							</form:select>
							<form:errors path="location" cssClass="error-msg" />
						</div> --%>

				<div class="form-group">
					<label class="col-sm-3 control-label text-right"><spring:message
							code="lbl.assetdetails" /> </label>
					<div class="col-sm-3 add-margin">
						<form:textarea path="assetDetails"
							class="form-control text-left patternvalidation"
							data-pattern="alphanumeric" maxlength="256" />
						<form:errors path="assetDetails" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.modeofacquisition" /> <span class="mandatory"></span>
					</label>
					<div class="col-sm-3 add-margin">
						<form:select path="modeOfAcquisition" id="modeOfAcquisition"
							cssClass="form-control" required="required"
							cssErrorClass="form-control error">
							<form:option value="">
								<spring:message code="lbl.select" />
							</form:option>
							<form:options items="${modeOfAcquisitions}" />
						</form:select>
						<form:errors path="modeOfAcquisition" cssClass="error-msg" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label text-right"><spring:message
							code="lbl.status" /> <span class="mandatory"></span> </label>
					<div class="col-sm-3 add-margin">
						<form:select path="status.id" id="status" cssClass="form-control"
							required="required" cssErrorClass="form-control error">
							<form:option value="">
								<spring:message code="lbl.select" />
							</form:option>
							<form:options items="${egwStatus}" itemValue="id"
								itemLabel="code" />
						</form:select>
						<form:errors path="status" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.description" /> </label>
					<div class="col-sm-3 add-margin">
						<form:textarea path="description"
							class="form-control text-left patternvalidation"
							data-pattern="alphanumeric" maxlength="256" />
						<form:errors path="description" cssClass="error-msg" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label text-right"><spring:message
							code="lbl.dateofcreation" /> </label>
					<div class="col-sm-3 add-margin">
						<form:input path="dateOfCreation" class="form-control datepicker"
							data-date-end-date="0d" data-inputmask="'mask': 'd/m/y'" />
						<form:errors path="dateOfCreation" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.remarks" /> </label>
					<div class="col-sm-3 add-margin">
						<form:textarea path="remarks"
							class="form-control text-left patternvalidation"
							data-pattern="alphanumeric" maxlength="1024" />
						<form:errors path="remarks" cssClass="error-msg" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label text-right"><spring:message
							code="lbl.accdepreciation" /> </label>
					<div class="col-sm-3 add-margin">
						<form:input path="accDepreciation"
							class="form-control text-right patternvalidation"
							data-pattern="number" />
						<form:errors path="accDepreciation" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.length" /> </label>
					<div class="col-sm-3 add-margin">
						<form:input path="length"
							class="form-control text-right patternvalidation"
							data-pattern="number" />
						<form:errors path="length" cssClass="error-msg" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label text-right"><spring:message
							code="lbl.width" /> </label>
					<div class="col-sm-3 add-margin">
						<form:input path="width"
							class="form-control text-right patternvalidation"
							data-pattern="number" />
						<form:errors path="width" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.totalarea" /> </label>
					<div class="col-sm-3 add-margin">
						<form:input path="totalArea"
							class="form-control text-right patternvalidation"
							data-pattern="number" />
						<form:errors path="totalArea" cssClass="error-msg" />
					</div>
					<input type="hidden" name="asset" value="${asset.id}" /> 
				    <input type="hidden" id="selectedblock" value="${blockId}" /> 
				    <input type="hidden" id="selectedward" value="${wardId}" /> 
				    <input type="hidden" id="selectedstreet" value="${streetId}" />
				    <input type="hidden" id="typeaheadSourceType" />
				</div>
				<%@ include file="location-details.jsp"%>
					<div id="customFieldsDiv">
						<%@ include file="asset-edit-assetcategory-properties.jsp"%>
					</div>
					</div>