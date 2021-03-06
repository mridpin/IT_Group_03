<%-- 
    Document   : index
    Created on : Feb 6, 2018, 10:12:57 AM
    Author     : group03
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    int ratio = 1;
    int limit = 100;
    int i = 0;
    Integer prevValue = 1;
    Integer nextValue = 1;
    Integer diff = 0;
    List<Integer[]> res = new ArrayList<>();
    String url = "";

    public List<Integer[]> getProgression(int ratio) {
        i = 0;
        do {
            nextValue = (int) Math.pow(ratio, i);
            if (i == 0) {
                diff = 0;
            } else {
                prevValue = res.get(res.size() - 1)[0];
                diff = nextValue - prevValue;
            }
            if (nextValue < limit) {
                res.add(new Integer[]{nextValue, diff});
            }
            i++;
        } while (nextValue < limit);
        return res;
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>IT G03 EPD01 EJ2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>IT G03 EPD01 EJ2</h1>
        
        <%
            for (ratio = 2; ratio < 6; ratio++) {
                res = getProgression(ratio);
                out.write("<h3>Ratio: " + ratio+ "</h3>");
                url = "https://chart.googleapis.com/chart?";
                url += "cht=lc&"
                        + "chs=500x200&"
                        + "chd=t:";
                // Loop for table
                out.write("<table border='2'><tr><th>Valores</th><th>Diferencia</th></tr>");
                for (Integer[] tr : res) {
                    out.write("<tr><td>" + tr[0] + "</td><td>" + tr[1] + "</td></tr>");
                }
                out.write("</table>");
                // Loop for values
                for (Integer[] tr : res) {
                    url += tr[0] + ",";
                }
                url = url.substring(0, url.length() - 1); // Remove last comma
                url += "|";
                // Loop for difference
                for (Integer[] tr : res) {
                    url += tr[1] + ",";
                }
                url = url.substring(0, url.length() - 1); // Remove last comma
                url += "&chco=FF0000,0000FF";
                url += "&chdl=Valores|Diferencias";
                url += "&chxt=x,y";
                res.clear();
                out.write("<br /><img src='" + url + "'>");
            }
        %>
    </body>
</html>
