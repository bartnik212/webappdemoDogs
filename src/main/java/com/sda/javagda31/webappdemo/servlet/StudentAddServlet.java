package com.sda.javagda31.webappdemo.servlet;

import com.sda.javagda31.webappdemo.database.EntityDao;
import com.sda.javagda31.webappdemo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/student/form")
public class StudentAddServlet extends HttpServlet {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    // metoda której celem/zadaniem jest zwrócić użytkownikowi formularz
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/student_form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = Student.builder()
                .birthDate(LocalDate.parse(req.getParameter("birthDateValue")))
                .special(req.getParameter("specialValue") != null && req.getParameter("specialValue").equals("on"))
                .ects(Double.parseDouble(req.getParameter("ectsValue")))
                .lastName(req.getParameter("lastNameValue"))
                .firstName(req.getParameter("firstNameValue"))
                .build();

        studentEntityDao.saveOrUpdate(student);

        // na koniec robimy redirect
        resp.sendRedirect(req.getContextPath() + "/student/form");
    }
}
