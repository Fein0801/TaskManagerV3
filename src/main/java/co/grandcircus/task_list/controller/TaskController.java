package co.grandcircus.task_list.controller;

import static co.grandcircus.task_list.controller.UserController.currentUser;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.task_list.model.Task;
import co.grandcircus.task_list.repo.TaskRepository;

@Controller
public class TaskController {

	@Autowired
	private TaskRepository taskRepo;

	@RequestMapping("/add-task")
	public ModelAndView createTask() {
		return new ModelAndView("create-task", "user", currentUser);
	}

	@RequestMapping("/add-task-to-db")
	public ModelAndView addTask(@RequestParam("userId") Integer userId, @RequestParam("dueDate") String date, @RequestParam("description") String description) {
		if(currentUser == null) {
			return new ModelAndView("redirect:/");
		}
		
		LocalDate dueDate = LocalDate.parse(date);
		Task t = new Task(description, dueDate, userId);
		taskRepo.save(t);
		
		return new ModelAndView("redirect:/display?userId=" + userId);
	}
	
	@RequestMapping("/mark-complete")
	public ModelAndView markComplete(@RequestParam("id") Integer id) {
		Optional<Task> o = taskRepo.findById(id);
		if(o.isPresent()) {
			Task t = o.get();
			t.setCompleted(true);
			taskRepo.save(t);
			return new ModelAndView("redirect:/display?userId=" + t.getUserId());
		} else {
			return new ModelAndView("redirect:/display?userId=" + currentUser.getId());
		}
	}
	
	@RequestMapping("/edit-task")
	public ModelAndView editTask(@RequestParam("id") Integer taskId) {
		Optional<Task> o = taskRepo.findById(taskId);
		if(o.isPresent()) {
			ModelAndView mv = new ModelAndView("edit-task", "task", o.get());
			mv.addObject("completed", o.get().isCompleted());
			return mv;
		} else {
			return new ModelAndView("redirect:/display?userId=" + currentUser.getId());
		}
	}
	
	@RequestMapping("/modify")
	public ModelAndView modifyTask(@RequestParam("userId") Integer userId, @RequestParam("dueDate") String date, @RequestParam("description") String description, @RequestParam("id") Integer id, @RequestParam("completed") boolean completed) {
		Task t = new Task(id, description, completed, LocalDate.parse(date), userId);
		System.out.println(t);
		taskRepo.save(t);
		return new ModelAndView("redirect:/display?userId=" + t.getUserId());
	}
	
	@RequestMapping("/switch-complete")
	public ModelAndView switchCompletion(@RequestParam("completed") String completionStatus, @RequestParam("id") Integer taskId) {
		boolean completed = Boolean.parseBoolean(completionStatus);
		completed = !completed;
		Optional<Task> o = taskRepo.findById(taskId);
		ModelAndView mv = new ModelAndView("edit-task", "task", o.get());
		mv.addObject("completed", completed);
		return mv;
	}
	
	@RequestMapping("/delete-confirm")
	public ModelAndView confirmDelete(@RequestParam("id") Integer id) {
		Task t = taskRepo.findById(id).get();
		return new ModelAndView("delete", "task", t);
	}
	
	@RequestMapping("/delete-task")
	public ModelAndView delete(@RequestParam("id") Integer id) {
		taskRepo.deleteById(id);
		return new ModelAndView("redirect:/display?userId=" + currentUser.getId());
	}
}
