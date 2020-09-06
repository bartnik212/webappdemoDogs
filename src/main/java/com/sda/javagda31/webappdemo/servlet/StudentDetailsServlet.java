package com.sda.javagda31.webappdemo.servlet;

import com.sda.javagda31.webappdemo.database.EntityDao;
import com.sda.javagda31.webappdemo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/student/details")
public class StudentDetailsServlet extends HttpServlet {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // identyfikator który odbieramy z listy studentów
        String studentIdString = req.getParameter("id");
        Long studentId = Long.parseLong(studentIdString);

        // po dokonaniu parsowania ze String'a na Long'a szukamy studenta w bazie
        Optional<Student> studentOptional = studentEntityDao.findById(studentId, Student.class);
        if (studentOptional.isPresent()) {
            Student student = studentOptional.get(); // po odnalezieniu studenta

            req.setAttribute("student", student);   // przekazujemy go do widoku poprzez atrybut

            // wyświetl widok
            req.getRequestDispatcher("/student_details.jsp").forward(req, resp);
        } else {
            // jeśli nie udało się odnaleźć studenta, to wróć do listy studentów
            resp.sendRedirect(req.getContextPath() + "/student");
        }
    }
}
