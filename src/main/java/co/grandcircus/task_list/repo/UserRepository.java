package co.grandcircus.task_list.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.task_list.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	boolean existsByEmail(String email);
	boolean existsByPassword(String password);
	
	User findByEmail(String email);
}
