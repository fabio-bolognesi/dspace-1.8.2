<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>

<%--
  - Display list of epeople, with continue and cancel buttons
  -
  - Attributes:
  -   collections - a Collection [] containing all collections in the system
  - Returns:
  -   submit set to add_eperson_add, user has selected an eperson
  -   submit set to add_eperson_cancel, user has cancelled operation
  -   group_id - set if user has selected one
  -   eperson_id - set if user has selected one

  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.eperson.Group"   %>

<%
    Group group = (Group) request.getAttribute("group");
    EPerson [] epeople = 
        (EPerson []) request.getAttribute("epeople");
%>

<dspace:layout titlekey="jsp.dspace-admin.group-eperson-select.title"
               navbar="admin"
               locbar="link"
               parenttitlekey="jsp.administer"
               parentlink="/dspace-admin"
               nocache="true">

    <%-- <h1>Select EPerson to Add to Group <%= group.getID() %></h1> --%>
    <h1><fmt:message key="jsp.dspace-admin.group-eperson-select.heading">
        <fmt:param><%= group.getID() %></fmt:param>
    </fmt:message></h1>

    <form method="post" action="">

    <table class="miscTable" align="center">
        <tr>
            <td>
                <input type="hidden" name="group_id" value="<%=group.getID()%>"/>
                
                <select size="15" name="eperson_id" multiple="multiple">
                        <%  for (int i = 0; i < epeople.length; i++) { %>
                            <option value="<%= epeople[i].getID()%>">
                                <%= epeople[i].getEmail()%>
                            </option>
                        <%  } %>
                </select>
            </td>
        </tr>
    </table>

    <center>
        <table width="70%">
            <tr>
                <td align="left">
                    <%-- <input type="submit" name="submit_add_eperson_add" value="Add EPerson"> --%>
                    <input type="submit" name="submit_add_eperson_add" value="<fmt:message key="jsp.dspace-admin.group-eperson-select.add"/>" />
                </td>
                <td align="right">
                    <%-- <input type="submit" name="submit_add_eperson_cancel" value="Cancel"> --%>
                    <input type="submit" name="submit_add_eperson_cancel" value="<fmt:message key="jsp.dspace-admin.general.cancel"/>" />
                </td>
            </tr>
        </table>
    </center>        

    </form>
</dspace:layout>
