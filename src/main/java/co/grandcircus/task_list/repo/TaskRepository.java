package co.grandcircus.task_list.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.task_list.model.Task;

public interface TaskRepository extends JpaRepository<Task, Integer> {

}
