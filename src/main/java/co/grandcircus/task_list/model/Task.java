package co.grandcircus.task_list.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String description;
	private boolean completed;
	private LocalDate dueDate;

	@Column(name = "user_id_fk")
	private Integer userId;

	@ManyToOne
	@JoinColumn(name = "user_id_fk", insertable = false, updatable = false)
	private User user;

	public Task() {
		super();
	}
	
	public Task(Integer id, String description, boolean completed, LocalDate dueDate, Integer userId) {
		super();
		this.id = id;
		this.description = description;
		this.completed = completed;
		this.dueDate = dueDate;
		this.userId = userId;
	}
	
	public Task(String description, LocalDate dueDate, Integer userId) {
		super();
		this.description = description;
		this.dueDate = dueDate;
		this.userId = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public LocalDate getDueDate() {
		return dueDate;
	}

	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", description=" + description + ", completed=" + completed + ", dueDate=" + dueDate
				+ ", userId=" + userId + ", user=" + user + "]";
	}
}
