<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.todolist.controllers.Task" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task List Application</title>
<link href ="styles.css" type ="text/css" rel ="stylesheet"></link>
</head>
<body>
<div class="navbar">
        <h1>Task List Application</h1>
    </div>

<div >
<form action="addTask" method="post" class="task-input">
            <input type="text" id="newTaskInput" name="newTaskInput" placeholder="Enter new task..." required>
            <button id="addTaskBtn" type="submit">Add New Task</button>
 </form>


<div class="task-list">
    <table>
         <% 
    ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
    if (tasks != null  && !tasks.isEmpty()) {%>
    <thead>
        <tr>
        <th style="width:2px">S.No</th>
        <th>Tasks</th>
        </tr>
        
        </thead>
        <tbody>
        <% for (Task task : tasks) { %>

<tr>
    <td style="width:2px"><%= task.getId() %></td>
    <td>
        <span data-task-id="<%= task.getId() %>"><%= task.getName() %></span>
        <span >
            <a href="deleteTask?taskId=<%= task.getId() %>"><button>Delete</button></a>
        </span>
    </td>
</tr>
            
<%
        } // end for loop
    } // end if check
%>
        </tbody>
    </table>
</div>
</div>
</body>
</html>