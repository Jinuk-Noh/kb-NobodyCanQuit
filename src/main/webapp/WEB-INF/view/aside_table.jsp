<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <%-- ${vilage.response.body.items.fsctItems} --%>
   
   <!-- TMX(�� �ְ���)�� 11�ÿ� ���� --> 
   <!-- TMN(��ħ �������)�� 02�ÿ� ���� --> 
    <table border = 1 class="table table-hover">
	 
    	 <c:forEach items="${vilage.response.body.items.fsctItems}" var="fsctItem">
            <tr>       
            <td width = 150>��ǥ����</td>                     	                         
             <td width = 150>${fsctItem.baseDate}</td>  
             <td width = 150>��ǥ�ð�</td>                     	                         
             <td width = 150>
         		 ${fsctItem.baseTime}
             </td>                                                                                            
            </tr>
           
            <tr>
            <td width = 150>�ڷᱸ�й���</td>
            <td width = 150>         
              <c:if test= "${fsctItem.category eq 'POP'}" >
               <c:out value ="����Ȯ��"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'PTY'}" >
               <c:out value ="��������"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'R06'}" >
               <c:out value ="6�ð� ������"/>
              </c:if>
                <c:if test= "${fsctItem.category eq 'S06'}" >
               <c:out value ="6�ð� ������"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'REH'}" >
               <c:out value ="����"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'SKY'}" >
               <c:out value ="�ϴû���"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'T3H'}" >
               <c:out value ="3�ð����"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'TMN'}" >
               <c:out value ="��ħ ���� ���"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'TMX'}" >
               <c:out value ="�� �ְ� ���"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'UUU'}" >
               <c:out value ="ǳ��"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'VVV'}" >
               <c:out value ="ǳ��"/>
              </c:if>
              <c:if test= "${fsctItem.category eq 'VEC'}" >
               <c:out value ="ǳ��"/>
              </c:if>                	
            </td>
             <td width = 150>���� ��</td>
            <td width = 150>
            <c:if test= "${fsctItem.category eq 'POP' || fsctItem.category eq 'REH'}" >
               <c:out value ="${fsctItem.fcstValue}%"/>
            </c:if>
           
             <c:if test= "${fsctItem.category eq 'T3H' || fsctItem.category eq 'TMX' || fsctItem.category eq 'TMN'}" >
               <c:out value ="${fsctItem.fcstValue}��"/>
            </c:if>
            
             <c:if test= "${fsctItem.category eq 'UUU' || fsctItem.category eq 'VVV' || fsctItem.category eq 'VEC' }" >
               <c:out value ="${fsctItem.fcstValue} m/s"/>
            </c:if>
            <br/> <!-- Ȯ�ο� -->${fsctItem.fcstValue}
          
            
            
            
            </td>
            </tr>         
            <tr>
            <td width = 150>x��ǥ</td>
            <td width = 150>${fsctItem.nx}</td>
            <td width = 150>y��ǥ</td>
            <td width = 150>${fsctItem.ny}</td>
            </tr>
           
     </c:forEach>   
    
    </table>