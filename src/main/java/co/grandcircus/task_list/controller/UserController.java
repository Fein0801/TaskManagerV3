package co.grandcircus.task_list.controller;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.task_list.model.Task;
import co.grandcircus.task_list.model.User;
import co.grandcircus.task_list.repo.UserRepository;

@Controller
public class UserController {
	
	static User currentUser;
	@Autowired
	private UserRepository userRepo;

	@RequestMapping("/")
	public ModelAndView home() {
		return new ModelAndView("login-page");
	}
	
	@RequestMapping("/register")
	public ModelAndView register() {
		return new ModelAndView("registration-page");
	}
	
	@RequestMapping("/add-user")
	public ModelAndView addUser(User user) {
		if(userRepo.existsByEmail(user.getEmail())) {
			return new ModelAndView("registration-page", "error", "A user with that email already exists.");
		}
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		userRepo.save(user);
		currentUser = user;
		return new ModelAndView("login-page", "userInfo", user);
	}
	
	@RequestMapping("/log-in")
	public ModelAndView logIn(@RequestParam("email") String email, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView("task-display");
		if(userRepo.existsByEmail(email)) {
			User user = userRepo.findByEmail(email);
			if(BCrypt.checkpw(password, user.getPassword()) || userRepo.existsByPassword(password)) {
				mv.addObject("user", user);
				
				List<Task> userTasks = user.getTasks();
				if(userTasks.size() == 0) {
					mv.addObject("noTasks", "You don't have any tasks!");
				} else {
					mv.addObject("taskList", userTasks);
				}
				currentUser = user;
			} else {
				return new ModelAndView("login-page", "error", "Password does not match our records.");
			}
		} else {
			return new ModelAndView("login-page", "error", "That email address is not in our records.");
		}
		return mv;
	}
	
	@RequestMapping("/display")
	public ModelAndView display(@RequestParam("userId") Integer userId) {
		User user = userRepo.findById(userId).get();
		ModelAndView mv = new ModelAndView("task-display", "user", user);
		mv.addObject("taskList", user.getTasks());
		return mv;
	}
}
