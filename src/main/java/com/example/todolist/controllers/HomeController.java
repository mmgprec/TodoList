package com.example.todolist.controllers;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller 
public class HomeController
{
	ArrayList<Task> tasks= new ArrayList<>();
	@RequestMapping("/")
	public ModelAndView homepage()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("tasks",tasks);
		mv.setViewName("homepage.jsp");
		return mv;
	}
	@PostMapping("/addTask")
	public ModelAndView addTask(@RequestParam("newTaskInput") String name)
	{
		ModelAndView mv = new ModelAndView();
		Task t = new Task();
		t.setId(tasks.size()+1);
		t.setName(name);
		tasks.add(t);
		mv.addObject("tasks",tasks);
		mv.setViewName("homepage.jsp");
		return mv;
	}
	@GetMapping("/deleteTask")
	public ModelAndView deleteTask(@RequestParam("taskId") int taskId) {
	    ModelAndView mv = new ModelAndView();
	    tasks.removeIf(task -> task.getId() == taskId);
	    mv.addObject("tasks", tasks);
	    if (tasks.isEmpty()) 
	    {
	        return new ModelAndView("redirect:/");
	    }
	    mv.setViewName("homepage.jsp");
	    return mv;
	}
}