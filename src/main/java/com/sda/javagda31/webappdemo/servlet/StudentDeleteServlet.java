package com.sda.javagda31.webappdemo.servlet;

import com.sda.javagda31.webappdemo.database.EntityDao;
import com.sda.javagda31.webappdemo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/student/delete")
public class StudentDeleteServlet extends HttpServlet {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long studentId = Long.parseLong(req.getParameter("id"));

        Optional<Student> studentOptional = studentEntityDao.findById(studentId, Student.class);
        if (studentOptional.isPresent()) {
            Student student = studentOptional.get();
            studentEntityDao.delete(student);
        }
        resp.sendRedirect(req.getContextPath() + "/student");
    }
}
